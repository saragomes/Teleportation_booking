require 'spec_helper'

describe Teleporter do
  
	it { should validate_presence_of :name }
  it { should validate_presence_of :departure_date }
  it { should validate_uniqueness_of(:name).scoped_to(:departure_date) }

  it { should have_many :bookings }
  it { should have_many :passengers }


  let(:teleporter) { FactoryGirl.build :teleporter }
  subject { teleporter }

  context "when departure_date is before the current time" do
    it {should_not allow_value(1.day.ago).
        for(:departure_date)}
  end

  context "when the departure_date is after the start_date" do
    it {should allow_value(teleporter.departure_date + 1.day).
        for(:departure_date)}
  end

  # describe "today_task" do
  #   before do
  #     @user1 = FactoryGirl.create(:user)
  #     @user2 = FactoryGirl.create(:user)
  #     @task1 = FactoryGirl.create(:task, :date => Date.yesterday, :done => false, :user => @user1)
  #     @task2 = FactoryGirl.create(:task, :date => Date.today, :done => false, :user => @user1)
  #     @task3 = FactoryGirl.create(:task, :date => Date.today, :done => true, :user => @user1)
  #     @task4 = FactoryGirl.create(:task, :date => Date.tomorrow, :done => false, :user => @user2)
  #     @task5 = FactoryGirl.create(:task, :date => Date.today, :done => false, :user => @user2)
  #     @task6 = FactoryGirl.create(:task, :date => Date.today, :done => true, :user => @user2)
  #   end
  #   context "When task is late" do
  #     it "user1 should have 1 today task" do
  #       @user1.today_tasks.should === [@task2]
  #     end
  #     it "should not be late" do
  #       @user2.today_tasks.should === [@task5]
  #     end
  #   end
  # end
end
