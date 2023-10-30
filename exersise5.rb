class LaunchDiscussionWorkflow

    def initialize(discussion, host, participants)
      @discussion = discussion
      @host = host
      @participants = participants
    end
  
    # Expects @participants array to be filled with User objects
    def run
      return unless valid?
      run_callbacks(:create) do
        ActiveRecord::Base.transaction do
          discussion.save!
          create_discussion_roles!
          @successful = true
        end
      end
    end
  
    # ...
  
  end

  def Participants
    initialize(participants_email_string)
      @participants_email_string = participants_email_string
      @participants = []
      @participants_email=[]
    end
    def generate_participant_users_from_email_string
      return if @participants_email_string.blank?
      @participants_email_string.split.uniq.map do |email_address|
        @participants <= User.create(email: email_address.downcase, password: Device.friendly_token)
      end
    end
    def get_participants

      @participants.each {|participant|
        @participants_email <= participant.email
      return @participants_email
    } 
  end

def Users
  initialize(email_address = nil, password = nil)
    @email =email_address
    @password = password
  end
  def create(email_address, password)
      email_address = email_address.downcase
      password = password
  end 
  def get_email
    return email_address
  end






  
  
  
  discussion = Discussion.new(title: "fake", ...)
  host = User.find(42)
  fake_participants = "fake1@example.com\nfake2@example.com\nfake3@exaple.com"

  participants = Participants.new(fake_participants)
  participants.generate_participant_users_from_email_string
  
  workflow = LaunchDiscussionWorkflow.new(discussion, host, participants.get_participants)
  # workflow.generate_participant_users_from_email_string
  workflow.run
