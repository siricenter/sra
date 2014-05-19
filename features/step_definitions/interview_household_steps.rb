When(/^I fill out the interview form$/) do
	select 'tin', from: 'interview[roof]'
	select 'adobe', from: 'interview[wall]'
	select 'cement', from: 'interview[floor]'
	select 'gas', from: 'interview[fuel_type]'
	select 'piped', from: 'health[water_source]'
	select 'outhouse', from: 'health[bathroom_type]'
	select 'buried', from: 'health[garbage_disposal]'
	select 'outhouse', from: 'health[sewage_disposal]'

	fill_in 'interview[bedroom_count]', with: '1'
	fill_in 'interview[total_income]', with: '500'
	select 'month', from: 'interview[income_unit]'

	fill_in 'expense[shoe_cost]', with: '10'
	select 'year', from: 'expense[shoe_unit]'

	fill_in 'expense[clothing_cost]', with: '10'
	select 'year', from: 'expense[clothing_unit]'

	fill_in 'expense[medical_cost]', with: '10'
	select 'year', from: 'expense[medical_unit]'

	fill_in 'expense[school_cost]', with: '10'
	select 'year', from: 'expense[school_unit]'

	fill_in 'expense[college_cost]', with: '10'
	select 'year', from: 'expense[college_unit]'

	fill_in 'expense[utilities_cost]', with: '10'
	select 'year', from: 'expense[utilities_unit]'

	fill_in 'expense[misc_cost]', with: '10'
	select 'year', from: 'expense[misc_unit]'

	fill_in 'morbidity[adult_sickness_frequency]', with: '2'
	select 'year', from: 'morbidity[adult_sickness_time]'

	fill_in 'morbidity[adult_aid]', with: 'witch doctor'
	fill_in 'morbidity[adult_common_ailment]', with: 'influenza'

	fill_in 'morbidity[child_sickness_frequency]', with: '2'
	select 'year', from: 'morbidity[child_sickness_time]'

	fill_in 'morbidity[child_aid]', with: 'witch doctor'
	fill_in 'morbidity[child_common_ailment]', with: 'influenza'

	click_on 'Create Interview'
end
