class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :user, index: true
      t.references :state, index: true
      t.string :company_name
      t.string :company_url
      t.string :position
      t.string :city
      t.string :application_url
      t.text :mission
      t.text :notes
      t.boolean :write_cv
      t.integer :est_salary
      t.boolean :review_resume
      t.boolean :apply
      t.timestamp :apply_time
      t.boolean :confirmation
      t.boolean :interview
      t.timestamp :interview_date
      t.text :interview_notes
      t.boolean :offer
      t.integer :salary
      t.text :offer_notes
      t.date :start_date
      t.boolean :accept

      t.timestamps
    end
  end
end
