When(/^I fill out the interview form$/) do
	#select 'tin', from: 'interview[roof]'
	#select 'adobe', from: 'interview[wall]'
	#select 'cement', from: 'interview[floor]'
	#select 'gas', from: 'interview[fuel_type]'
	#select 'piped', from: 'health[water_source]'
	#select 'outhouse', from: 'health[bathroom_type]'
	#select 'buried', from: 'health[garbage_disposal]'
	#select 'outhouse', from: 'health[sewage_disposal]'

	#fill_in 'interview[bedroom_count]', with: '1'
	#fill_in 'interview[total_income]', with: '500'
	#select 'month', from: 'interview[income_unit]'

	#fill_in 'expense[shoe_cost]', with: '10'
	#select 'year', from: 'expense[shoe_unit]'

	#fill_in 'expense[clothing_cost]', with: '10'
	#select 'year', from: 'expense[clothing_unit]'

	#fill_in 'expense[medical_cost]', with: '10'
	#select 'year', from: 'expense[medical_unit]'

	#fill_in 'expense[school_cost]', with: '10'
	#select 'year', from: 'expense[school_unit]'

	#fill_in 'expense[college_cost]', with: '10'
	#select 'year', from: 'expense[college_unit]'

	#fill_in 'expense[utilities_cost]', with: '10'
	#select 'year', from: 'expense[utilities_unit]'

	#fill_in 'expense[misc_cost]', with: '10'
	#select 'year', from: 'expense[misc_unit]'


	#fill_in 'morbidity[adult_sickness_frequency]', with: '2'
	#select 'year', from: 'morbidity[adult_sickness_time]'
	#fill_in 'morbidity[adult_aid]', with: 'witch doctor'
	#fill_in 'morbidity[adult_common_ailment]', with: 'influenza'

	#
	#fill_in 'morbidity[child_sickness_frequency]', with: '2'
	#select 'year', from: 'morbidity[child_sickness_time]'
	#fill_in 'morbidity[child_aid]', with: 'witch doctor'
	#fill_in 'morbidity[child_common_ailment]', with: 'influenza'

	# Testing new food consumed

	fill_in 'consumed_food_search', with: 'chard'
	click_on 'Search!'
	find_by_id("513fceb575b8dbbc21001506").click  # A specific result for chard

	select '2', from: 'consumed_foods[consumed_food_1[servings]]'
	select 'daily', from: 'consumed_foods[consumed_food_1[frequency]]'

	# Testing new food stored

	#click_on 'Add New Food Stored'

	#fill_in 'stored_foods[stored_food1[name]]', with: 'Chard'
	#fill_in 'stored_foods[stored_food1[amount]]', with: '100'
	#select 'grams', from: 'stored_foods[stored_food1[unit]]'

	#click_on 'Add New Food Stored'

	#fill_in 'stored_foods[stored_food2[name]]', with: 'Carrots'
	#fill_in 'stored_foods[stored_food2[amount]]', with: '100'
	#select 'grams', from: 'stored_foods[stored_food2[unit]]'

	## Testing new food purchased

	#click_on 'Add Food Purchased'

	#fill_in 'purchased_foods[food1[name]]', with: 'Chard'
	#fill_in 'purchased_foods[food1[amount]]', with: '100'
	#select 'grams', from: 'purchased_foods[food1[unit]]'
	#fill_in 'purchased_foods[food1[frequency_amount]]', with: '3'
	#select 'day', from: 'purchased_foods[food1[time_unit]]'

	#click_on 'Add Food Purchased'

	#fill_in 'purchased_foods[food2[name]]', with: 'Carrots'
	#fill_in 'purchased_foods[food2[amount]]', with: '100'
	#select 'grams', from: 'purchased_foods[food2[unit]]'
	#fill_in 'purchased_foods[food2[frequency_amount]]', with: '3'
	#select 'day', from: 'purchased_foods[food2[time_unit]]'

	click_on 'Create Interview'
end

When(/^I edit the interview form$/) do
	select '3', from: 'consumed_foods[consumed_food_513fceb575b8dbbc21001506[servings]]'
	select 'weekly', from: 'consumed_foods[consumed_food_513fceb575b8dbbc21001506[frequency]]'
	click_on 'Update Interview'
end

Then(/^the interview should reflect the changes I made$/) do
	expect(Interview.last.consumed_foods.first.servings).to eq(3)
	expect(Interview.last.consumed_foods.first.frequency).to eq('weekly')
end
