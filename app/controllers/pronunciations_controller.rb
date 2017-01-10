# frozen_string_literal: true
class PronunciationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    pronunciation = Pronunciation.new(permitted_params)
    if pronunciation.save
      flash[:info] = 'Pronunciation uploaded successfully.'
    else
      pronunciation_errors = pronunciation.errors.full_messages.to_sentence
      flash[:error] = "Unable to upload pronunciation. #{pronunciation_errors}"
    end
    redirect_to pronounceable_path(pronunciation.pronounceable)
  end

  private def permitted_params
    params.require(:pronunciation).permit(
      :id,
      :pronounceable_id,
      :user_id,
      :audio_file
    )
  end
end
