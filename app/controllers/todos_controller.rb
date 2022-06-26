class TodosController < ApplicationController
    
    def index
    #    #   render plain: Todo.all.map{|todo| todo.to_pleasant_string}.join("\n")
    #    render plain: Todo.order(:due_date).map{|todo| todo.to_pleasant_string}.join("\n") 
    render "index"
    end
    
    def create 
        todo = Todo.new(todo_params)
        begin todo.save 
            redirect_to todos_path
        rescue => exception
            render plain: "Unsuccessfull"
        end
    end

    def update 
        id = params[:id]
        completed = params[:completed]
        todo = Todo.find(id)
        todo.completed = completed
        todo.save
        redirect_to todos_path
    end

    def destroy
        id = params[:id]
        todo = Todo.find(id)
        todo.destroy
        todo.save  
        redirect_to todos_path
    end

    private 
    def todo_params
      params.require(:todo).permit(:todo_text, :due_date)
    end
end
