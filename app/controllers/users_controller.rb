class UsersController < ApplicationController
  before_filter :require_login, :only => [:upload_page, :show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to secret_url, :notice => "Residencial Ingresado Correctamente!"
    else
      render :new
    end
  end

  
  
  def add_banned_name
    visitor_name=params[:visitor_name]
    visitor_doc =params[:visitor_id_number]
    
    if(visitor_doc=="")
      print "***************** no hay doc de identificacion **************"
      @banned_name=BannedName.new(:name=>visitor_name, :id_doc => visitor_doc,:user_id=>current_user.id)
      current_user.banned_names << @banned_name
      current_user.save
      @p=false
    else
      @vis = Visitor.new(:name=>visitor_name,:id_number=>visitor_doc,:visitor_status_id=>1)
      current_user.banned_visitors<<@vis
      @p=true
    end
    respond_to do |format|
      format.js
    end
  end
  def search_visitor_date
    emptyarray=[]
    begindate=params[:begin]
    print "******************************************************"
    start_date = DateTime.civil(params[:record][:"begin(1i)"].to_i,params[:record][:"begin(2i)"].to_i,params[:record][:"begin(3i)"].to_i,params[:record][:"begin(4i)"].to_i,params[:record][:"begin(5i)"].to_i)
    end_date = DateTime.civil(params[:record][:"end(1i)"].to_i,params[:record][:"end(2i)"].to_i,params[:record][:"end(3i)"].to_i,params[:record][:"end(4i)"].to_i,params[:record][:"end(5i)"].to_i)
    
    if params[:user_id]!=nil
      user=User.find(params[:user_id])
      @records=user.records.where("entrance>=:start AND entrance<=:end ",{:start=>start_date,:end=>end_date}).order("entrance DESC")
    else
      @records=current_user.records.where("entrance>=:start AND entrance<=:end ",{:start=>start_date,:end=>end_date}).order("entrance DESC")
    end
    respond_to do |format|
      format.js
    end
  end
  def search_visitor_plate
    if params[:user_id]!=nil
      user=User.find(params[:user_id])
      @records=user.records.where("plate_number=:number",{:id=>params[:id],:number=>params[:plate_number]})
    else
      @records=current_user.records.where("plate_number=:number",{:id=>params[:id],:number=>params[:plate_number]})
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  def search_visitor_name
    if params[:user_id]!=nil
      user=User.find(params[:user_id])
      vis=user.visitors.where("name=:name",{:id=>params[:id],:name=>params[:name]}).first
      if vis!=nil
        @records=user.records.where("visitor_id=:name",{:id=>params[:id],:name=>vis.id})
      end
    else
      vis=current_user.visitors.where("name=:name",{:id=>params[:id],:name=>params[:name]}).first
      if vis!=nil
        @records=current_user.records.where("visitor_id=:name",{:id=>params[:id],:name=>vis.id})
      end
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
  def restore_visitors_list
    if params[:user_id]!=nil
      user=User.find(params[:user_id])
      @records=user.records
    else
      @records=current_user.records
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def sup_banned
    BannedName.delete(params[:id])
    @p=params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end
  def add_ban_vis
    @vis=Visitor.find(params[:id])
    current_user.banned_visitors<<@vis
    @p=params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  
  end
  def sup_banned_visitor
    banned_visitor=UserBannedList.where("visitor_id=:vis AND user_id=:usr",{:vis=>params[:id],:usr=>current_user.id})
    UserBannedList.delete(banned_visitor[0].id)
    @p=params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  
  def show_visits
    if current_user.user_type_id==2
      redirect_to secret_url
    else
      if current_user.user_type_id==3
        redirect_to secret_admin_url
      else
        
      end
    end
     
  end
  def show_admin
    if current_user.user_type_id==1
      redirect_to secret_visits_url
    else
      if current_user.user_type_id==2
        redirect_to secret_url
      else
        
      end
    end
  end
  def upload_page
    if current_user.user_type_id==1
      redirect_to secret_visits_url
    else
      if current_user.user_type_id==3
        redirect_to secret_admin_url
      else
        
      end
    end
  end
  
  #admin's view methods
  
  def residential_admin_view
    @user=User.find(params[:id])
    
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  def visitor_admin_view
    @vis=Visitor.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  def agent_admin_view
    @user=User.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  def admin_admin_view
    @user=User.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  #************************

  def update
    user_id=params[:user_id]
    user_name=params[:name]
    user_physaddress=params[:physaddress]
    user_status_id=params[:user][:user_status_id]
    print "*************************************************************"
    @user = User.find(user_id)
    
    if @user
      @user.update_attributes(:name=>user_name,:physaddress=>user_physaddress,:user_status_id=>user_status_id)
      
    else
      print "***********************"
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def search_visitor_name_admin
    res=current_user.residential
    vis=res.visitors_records.where("name=:name",{:name=>params[:name]}).first
    
    if vis!=nil
      @records=res.records.where("visitor_id=:id",{:id=>vis.id})
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def search_visitor_plate_admin
  
  end
  def show
  end

  def index
  end

  def edit
  end
  def add_residential_user
    respond_to do |format|
      format.html
      format.js
    end
  end
  def restoreAdminVis
    @records=current_user.residential.records
    respond_to do |format|
      format.html
      format.js
    end
  end
  def destroy
    User.destroy(params[:user_id])   
    redirect_to secret_admin_url
  end
end
#this methods only are executed from admin's view

