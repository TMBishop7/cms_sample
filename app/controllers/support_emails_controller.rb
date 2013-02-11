class SupportEmailsController < ApplicationController

  before_filter :load_user
  # GET /support_emails/1
  # GET /support_emails/1.json
  def show
    @support_email = @user.support_email

    if @support_email == nil
      @support_email = @user.build_support_email
      render action: "new"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @support_email }
      end
    end
  end

  # GET /support_emails/new
  # GET /support_emails/new.json
  def new
    @support_email = @user.build_support_email

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @support_email }
    end
  end

  # GET /support_emails/1/edit
  def edit
    @support_email = @user.support_email
  end

  # POST /support_emails
  # POST /support_emails.json
  def create
    @support_email = @user.build_support_email(params[:support_email])

    respond_to do |format|
      if @support_email.save
        format.html { redirect_to user_support_email_url, :flash => { success: 'Successfully saved.' } }
        format.json { render json: @support_email, status: :created, location: @support_email }
      else
        format.html { render action: "new" }
        format.json { render json: @support_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /support_emails/1
  # PUT /support_emails/1.json
  def update
    @support_email = @user.support_email

    respond_to do |format|
      if @support_email.update_attributes(params[:support_email])
        format.html { redirect_to user_support_email_url, :flash => { success: 'Successfully updated.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @support_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_emails/1
  # DELETE /support_emails/1.json
  def destroy
    @support_email = @user.support_email
    @support_email.destroy

    respond_to do |format|
      format.html { redirect_to new_user_support_email_url, :flash => { success: 'Successfully deleted.' } }
      format.json { head :no_content }
    end
  end
end
