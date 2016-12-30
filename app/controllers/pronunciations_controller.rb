class PronunciationsController < ApplicationController
  def create
    pronunciation = Pronunciation.new(permitted_params)
    if pronunciation.save
      flash[:info] = 'Pronunciation uploaded successfully.'
    else
      flash[:error] = "Unable to upload pronunciation. #{pronunciation.errors.full_messages.to_sentence}"
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
