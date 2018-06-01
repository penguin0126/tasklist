class Task < ApplicationRecord
  attr_accessor :deadline_form

  scope :by_status, -> (status){
    if status.present?
      status_bool = true
      if status == "true"
        status_bool = true
      else
        status_bool = false
      end
      where('status = ?', status_bool)
    end
  }

  validate :check_title
  validate :check_note
  validate :check_deadline_form

  private
  
  def check_title
    if !title.present?
      errors.add('enter', 'task')
    elsif name.length > 20
      errors.add("title is too long", "maximum is 20 characters")
    end
  end

  def check_note
    if note.present? && note.length > 100
      errors.add("note is too long", "maximum is 100 characters")
    end
  end

  def check_deadline_form
    if deadline_form.present? && !is_yyyymmdd?(deadline_form)
      errors.add("deadline","is invalid")
    end
  end

  def is_yyyymmdd?(yyyymmdd)
    if !yyyymmdd.present?
      return false
    end
    if yyyymmdd.length != 8
      return false
    end
    if !(yyyymmdd =~ /^[0-9]+$/)
      return false
    end

    result = true
    begin
      yyyy = yyyymmdd[0..3].to_i
      mm = yyyymmdd[4..5].to_i
      dd = yyyymmdd[6..7].to_i
      Date.new(yyyy,mm,dd)
    rescue
      result = false
    end
    result
  end
end
