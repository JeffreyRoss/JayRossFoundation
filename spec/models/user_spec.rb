require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) {build(:user)}

	it 'has a valid factory' do
		expect(user).to be_valid
	end	

	it { expect(user).to have_db_column(:first_name).of_type(:string).with_options(null: false) }
	it { expect(user).to have_db_column(:last_name).of_type(:string).with_options(null: false) }
	it { expect(user).to have_db_column(:home_phone).of_type(:string).with_options(null: true) }
	it { expect(user).to have_db_column(:mobile_phone).of_type(:string).with_options(null: true) }
	it { expect(user).to have_db_column(:email).of_type(:string).with_options(null: false) }
	it { expect(user).to have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }


	context 'validations' do

		it 'requires unique email' do
			expect(user).to validate_uniqueness_of(:email)
		end

		it 'requires email' do
			expect(user).to validate_presence_of(:email)
		end

		it 'requires encrypted_password' do
			expect(user).to validate_presence_of(:encrypted_password)
		end

		it 'confirms password'

		it 'is invalid without email' do
			expect(build(:user,email: nil)).not_to be_valid
		end

		it 'is invalid without password' do
			expect(build(:user, password: nil)).not_to be_valid
		end
	end

	describe '.encrypt_password' do
		let(:userWithoutPassword) {build(:user, password: nil)}
		let(:userWithPassword)	{build(:user)}
		subject(:salt) {BCrypt::Engine.generate_salt}
		subject(:encrypted_password) {BCrypt::Engine.hash_secret(userWithPassword.password, salt)}

		it 'is not called prior to save' do
			expect(userWithoutPassword.encrypted_password).to eq('')
		end

		it 'is called before save' do
			userWithPassword.save!
			expect(userWithPassword.encrypted_password).not_to eq('')
		end

	end

end

