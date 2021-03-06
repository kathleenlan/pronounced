# frozen_string_literal: true
class PronounceablesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_existing_pronounceable, only: [:show, :edit, :update]

  def index
    @q = Pronounceable.ransack(params[:q])
    @pronounceables = @q.result(distinct: true).page(current_page)
  end

  def new
    @pronounceable = Pronounceable.new
  end

  def create
    @pronounceable = Pronounceable.new(pronounceable_params)
    if @pronounceable.save
      flash[:info] = 'Pronounceable saved successfully.'
      redirect_to pronounceable_path(@pronounceable)
    else
      handle_pronounceable_creation_failure
    end
  rescue ActiveRecord::StatementInvalid
    handle_pronounceable_creation_failure
  end

  def show
    @pronounceable.increment_view_count!
  end

  def edit; end

  def update
    if @pronounceable.update_attributes(pronounceable_params)
      flash[:info] = 'Changes saved successfully.'
      redirect_to pronounceable_path(@pronounceable)
    else
      pronounceable_errors = @pronounceable.errors.full_messages.to_sentence
      flash[:error] = "Unable to save changes. #{pronounceable_errors}"
      render 'edit'
    end
  end

  private def set_existing_pronounceable
    pronounceable = Pronounceable.find(params[:id])
    @pronounceable = PronounceablePresenter.new(pronounceable)
  end

  private def pronounceable_params
    params.require(:pronounceable).permit(
      :id,
      :name,
      :language_id
    )
  end

  # Note: If params[:page] is nil, then Kaminari's .page method will default to
  # retrieving the first page.
  private def current_page
    params[:page]
  end

  private def handle_pronounceable_creation_failure
    pronounceable_errors = @pronounceable.errors.full_messages.to_sentence
    flash[:error] = "Unable to save pronounceable. #{pronounceable_errors}."
    render 'new'
  end
end
