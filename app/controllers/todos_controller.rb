class TodosController < ApplicationController
    
    def index
    #    #   render plain: Todo.all.map{|todo| todo.to_pleasant_string}.join("\n")
    #    render plain: Todo.order(:due_date).map{|todo| todo.to_pleasant_string}.join("\n") 
    current_user
    @todos = current_user.todos
    render "index"
    end
    
    def create 
        todo = Todo.new(
            todo_text: todo_params[:todo_text],
            due_date: todo_params[:due_date],
            completed: false,
            user_id: current_user.id
        )
        if todo.save 
            redirect_to todos_path
        else
            flash[:error] = todo.errors.full_messages.join(", ")
            redirect_to todos_path
        end
    end

    def update 
        id = params[:id]
        todo = current_user.todos.find(id)
        todo.completed = params[:completed]
        todo.save
        redirect_to todos_path
    end

    def destroy
        id = params[:id]
        todo = current_user.todos.find(id)
        todo.destroy
        todo.save  
        redirect_to todos_path
    end
    
    private 
    def todo_params
      params.require(:todo).permit(:todo_text, :due_date)
    end
end
