class SubjectsController < ApplicationController
    
    def show
        @subject = Subject.find(params[:id])
    end

    def index
        if params[:user_flashcards]
            @subjects = Subject.find(params[:flashcard_id]).subjects
        end
    end

    def new
        @subject = Subject.new
    end

    def create
        @subject = Subject.new(subject_params)
        if @subject.save 
            redirect_to flashcards_path
        else
            render :new
        end
    end

    def subject_params
        params.require(:subject).permit(:name)
    end
end
