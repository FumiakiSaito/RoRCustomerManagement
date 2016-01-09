class Staff::SessionsController < Staff::Base

  def new
    if current_staff_member
      redirect_to :staff_root
    else
      # フォームオブジェクト作成
      @form = Staff::LoginForm.new
      render action: 'new'
    end
  end

  def create
    # formパラメータを取得
    @form = Staff::LoginForm.new(params[:staff_login_form])

    # emailで検索
    if @form.email.present?
      staff_member = StaffMember.find_by(email_for_index: @form.email.downcase)
    end

    # 認証
    if Staff::Authenticator.new(staff_member).authenticate(@form.password)
      session[:staff_member_id] = staff_member.id
      redirect_to : staff_root
    else
      render action: 'new'
    end
  end

  # ログアウト
  def destroy
    session.delete(:staff_member_id)
    redirect_to :staff_root
  end
end
