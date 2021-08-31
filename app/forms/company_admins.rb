class CompanyAdmins

  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :name, :name_kana, :place, :place_remark, :start, :finish, :time, :salary

  def save
    ActiveRecord::Base.transaction do
      company = Company.create(name: name, name_kana: name_kana)
      Admin.create(name: name, name_kana: name_kana, place: place, place_remark: place_remark,
             start: start, finish: finish, time: time, salary: salary, company_id: company.id )
    end
  end
end