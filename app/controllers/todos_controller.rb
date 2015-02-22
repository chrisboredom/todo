class TodosController < ApplicationController

	before_filter :authenticate_user! 
	
	def index
		@todos = current_user.todos
	end

	def show
	end

	def new
		@todo = current_user.todos.build
	end

	def create
		@todo = current_user.todos.build(todo_params)
		@todo.save
		redirect_to todos_path
	end

	def edit
		@todo = find_todo
	end

	def update
		@todo = find_todo
		@todo.update_attributes(todo_params)
		redirect_to todos_path
	end

	def delete
		@todo = find_todo
	end

	def destroy
		@todo = find_todo
		@todo.destroy
		redirect_to todos_path
	end

	private

	def find_todo
		current_user.todos.find(params[:id])
	end

	def todo_params
		params.require(:todo).permit(:user_id, :item)
	end
end
