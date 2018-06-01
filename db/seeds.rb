title = "Hi! I'm Jason"
note = 'Why Japanese people!?'
deadline = Date.today
status = true

Task.create!(
  title: title,
  note: note,
  deadline: deadline,
  status: status
)

10.times do |n|
  title += n.to_s
  note = n.to_s
  deadline += 7
  status = n % 2 == 0 ? true : false
  Task.create!(
    title: title,
    note: note,
    deadline: deadline,
    status: status
  )
end
