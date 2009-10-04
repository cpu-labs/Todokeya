class OrdersController < ApplicationController
  include ::OrdersHelper

  auto_complete_for :profile, :email
  
  # GET /orders

  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @profiles = @order.profiles
  end

  def split_emails_to_profiles( emails)
    email_array = emails.split(",")
    profiles = []
    email_array.each { |email|
      profile = Profile.find_by_email( email)
      profiles << profile unless profile.nil?
    }
    profiles
  end

  def regist_order( order_id, profile_id)

    @link = Link.new({:order_id => order_id,
                              :profile_id => profile_id.to_i})
    @link.save
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])
    @profiles = split_emails_to_profiles( params[:profile][:email])

    respond_to do |format|
      if @order.save

        @profiles.each { |profile|
          regist_order( @order.id, profile.id)
        }

        flash[:notice] = 'Order was successfully created.'
        format.html { redirect_to(@order) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        flash[:notice] = 'Order was successfully updated.'
        format.html { redirect_to(@order) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
