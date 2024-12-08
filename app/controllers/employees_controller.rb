class EmployeesController < ApplicationController

    def index
      @employees = Employee.all 
    end

    def show
      @employee = Employee.find(params[:id])
    end

    def new
      @employee = Employee.new
      @dogs = Dog.all
    end

    def create
      @employee = Employee.new(employee_params)
      @dogs = Dog.all

      if @employee.save
        redirect_to employees_path
      else
        @errors = @employee.errors.full_messages
        render :new
      end
    end

    def edit
      @employee = Employee.find(params[:id])
      @dogs = Dog.all
    end

    def update
      @employee.assign_attributes(employee_params)
      
      if @employee.save
        redirect_to employees_path(@employee)
      else
        @errors = @employee.errors.full_messages
        render :new
      end
    end

    def destroy
      @employee = Employee.find(params[:id]).destroy
      redirect_to employees_path
    end

    private

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

end
