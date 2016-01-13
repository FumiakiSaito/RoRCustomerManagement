class Admin::StaffEventsController < Admin::Base
  def index
    if params[:staff_member_id]
      @staff_member = StaffMember.find(params[:staff_member_id])
      @events = @staff_member.events
    else
      @events = StaffEvent
    end
    # pageメソッドはkaminariが提供しているもの
=begin
    @events = @events.order(occurred_at: :desc)
    @events = @events.includes(:member)
    @events = @events.page(params[:page])
=end
    @events = @events.order(occurred_at: :desc).includes(:member).page(params[:page])
  end
end
