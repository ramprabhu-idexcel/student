class CourseSubjectsController < ApplicationController
  load_and_authorize_resource
  prepend_before_filter do
    params[:course_subject] &&= course_subject_params
  end
  before_action :set_course_subject, only: [:show, :edit, :update, :destroy]

  # GET /course_subjects
  # GET /course_subjects.json
  def index
    @course_subjects = CourseSubject.page(params[:page]).per(10)
  end

  # GET /course_subjects/1
  # GET /course_subjects/1.json
  def show
  end

  # GET /course_subjects/new
  def new
    @course_subject = CourseSubject.new
  end

  # GET /course_subjects/1/edit
  def edit
  end

  # POST /course_subjects
  # POST /course_subjects.json
  def create
    @course_subject = CourseSubject.new(course_subject_params)

    respond_to do |format|
      if @course_subject.save
        format.html { redirect_to @course_subject, notice: 'Course subject was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course_subject }
      else
        flash[:error] = @course_subject.errors.full_messages.join(",")
        format.html { render action: 'new' }
        format.json { render json: @course_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_subjects/1
  # PATCH/PUT /course_subjects/1.json
  def update
    respond_to do |format|
      if @course_subject.update(course_subject_params)
        format.html { redirect_to @course_subject, notice: 'Course subject was successfully updated.' }
        format.json { head :no_content }
      else
        flash[:error] = @course_subject.errors.full_messages.join(",")
        format.html { render action: 'edit' }
        format.json { render json: @course_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_subjects/1
  # DELETE /course_subjects/1.json
  def destroy
    @course_subject.destroy
    respond_to do |format|
      format.html { redirect_to course_subjects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_subject
      @course_subject = CourseSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_subject_params
      params.require(:course_subject).permit(:subject_id, :course_id)
    end
end
