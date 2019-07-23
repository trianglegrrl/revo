desc "Issue cards for the week"
task issue_this_weeks_cards: :environment do
  puts "Issuing cards for this week..."

  issue_cards!

  puts "done."
end

def issue_cards!
  User.clients.each do |u|
    schedule = u.default_user_action_steps.current

    next unless schedule.present?

    total = schedule.first[:action_step_ids].count
    puts "Generating #{total} #{'card'.pluralize(total)} for #{u.full_name}"
    u.generate_new_user_action_steps!
  end
end
