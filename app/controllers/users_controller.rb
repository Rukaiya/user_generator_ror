require 'roo'
class UsersController < ApplicationController
  def new
  end

  def upload_excel
    if params[:excel_file]
      excel = Roo::Excelx.new(params[:excel_file].tempfile)
      total_count = 0
      success_count = 0
      failure_count = 0
      failure_reasons = []

      excel.sheets.each do |sheet_name|
        sheet = excel.sheet(sheet_name)
        header = nil

        # Iterate over rows, skipping the header row
        sheet.each_with_index do |row, index|
          # set first row as header and store it
          if index.zero?
            header = row
            next
          end

          total_count += 1
          user_data = {}
          user_data[:first_name] = row[header.index('FIRST_NAME')]
          user_data[:last_name] = row[header.index('LAST_NAME')]
          user_data[:email] = row[header.index('EMAIL_ID')]
          user = User.new(user_data)
          if user.save
            success_count += 1
          else
            failure_count += 1
            failure_reasons << "Failed to save User(first_name:#{user_data[:first_name]}, last_name:#{user_data[:last_name]}, email:#{user_data[:email]}): #{user.errors.full_messages}"
          end
        end
      end

      flash[:notice] = "Total Users: #{total_count}, Successfully Added: #{success_count}, Failed: #{failure_count}"
      flash[:failure_reasons] = failure_reasons.join('<br>').html_safe
      redirect_to root_path
    else
      flash[:alert] = 'Please upload an Excel file.'
      redirect_to root_path
    end
  end
end