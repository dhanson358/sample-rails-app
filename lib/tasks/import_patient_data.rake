require 'csv'

PATIENTS = "sample_data/patients.csv"

task :import_patient_data => :environment do
  CSV.foreach(PATIENTS, headers: true) do |row|
    @data = row.to_h

    def gender
      if @data["Gender"] == "Female"
        return 1
      else
        return 0
      end
    end

    Patient.create(first_name: @data["First Name"],
                   last_name: @data["Last Name"],
                   gender: gender,
                   age: @data["Age"],
                   email: @data["Email"],
                   phone_number: @data["Phone"])
  end
end
