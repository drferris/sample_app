require 'spec_helper'

describe "Micropost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'micropost_content', with: "Lorem ipsum" }
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end
  end

  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end
    end

    describe 'as incorrect user' do
      let(:user2) { FactoryGirl.create(:user) }
      let!(:m1) { FactoryGirl.create(:micropost, user: user2) }

      before do
        sign_in user
        visit root_path
      end

      describe 'delete link should not be present' do
        it { should_not have_content('Delete') }
      end
    end
  end

  describe "for user with one micropost" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) {FactoryGirl.create(:micropost, user: user, content: 'Post number one') }

    before do
      sign_in user
      visit root_path
    end

    it { should have_content('micropost') }
    it { should_not have_content('microposts') }
  end

  describe "for user with multiple microposts" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) {FactoryGirl.create(:micropost, user: user, content: 'Post number one') }
    let!(:m2) {FactoryGirl.create(:micropost, user: user, content: 'Post number two') }

    before do
      sign_in user
      visit root_path
    end

    it { should have_content('microposts') }
  end
end
