Task.delete_all

name = 'Jason'
note = 'Why Japanese people!?'
deadline = Date.today
status = true

Task.create!(
  name: name,
  note: note,
  deadline: deadline,
  status: status
)

10.times do |n|
  name = Faker::Name.name
  note = n
  deadline += 7
  status = n % 2 == 0 ? true : false
  Task.create!(
    name: name,
    note: note,
    deadline: deadline,
    status: status
  )
end
