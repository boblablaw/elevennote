class NotesController < ApplicationController
  before_action :authorize_user
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :load_notes

  def show
    render :edit
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new note_params
    set_flash_for @note.save
    render_or_redirect
  end

  def update
    set_flash_for @note.update(note_params)
    render_or_redirect
  end

  def destroy
    @note = Note.find params[:id]
    set_flash_for @note.destroy
    redirect_to new_note_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body_html, :body_text)
  end

  def find_note
    @note = Note.find params[:id]
  end

  def load_notes
    @notes = Note.all
  end

  def set_flash_for(action_result)
    if action_result
      flash[:notice] = t("note.flash.#{action_name}.success")
    else
      flash.now[:alert] = t("note.flash.#{action_name}.failure")
    end
  end

  def render_or_redirect
    if @note.errors.any?
      render :edit
    else
      redirect_to @note
    end
  end
end
