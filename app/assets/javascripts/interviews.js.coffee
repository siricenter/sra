# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@eatenFoodCount = 0
@storedFoodCount = 0
@purchasedFoodCount = 0

createElement = (element) ->
	document.createElement element

@newFoodStored = () ->
	@storedFoodCount++
	newRow = foodRow "stored_food", @storedFoodCount

	beforeRow = document.getElementById "add_food_stored"

	addRow newRow, beforeRow


@newFoodEaten = () ->
	@eatenFoodCount++
	newRow = foodRow "consumed_food", @eatenFoodCount

	beforeRow = document.getElementById "add_food_eaten"

	addRow newRow, beforeRow

@newFoodPurchased = () ->
	@purchasedFoodCount++
	newRow = purchasedFoodRow()

	beforeRow = document.getElementById "add_food_purchase"

	addRow newRow, beforeRow

addRow = (row, before) ->
	form = document.getElementById "new_interview"
	form.insertBefore row, before

addOptions = (select, options) ->
	for element in options
		option = createElement "option"
		option.innerHTML = element
		select.appendChild option

foodRow = (name, count) ->
	newRow = createElement "div"
	newRow.setAttribute "class", "row"

	foodNameLabel = createElement "label"
	foodNameLabel.innerHTML = "Name: "
	foodNameLabel.setAttribute "class", "col-sm-2"

	foodNameInput = createElement "input"
	foodNameInput.setAttribute "type", "text_field"
	foodNameInput.setAttribute "class", "textfield " + "col-sm-2 " + "col-md-3"
	foodNameInput.setAttribute "name", "#{name}s[#{name}#{count}[name]]"

	foodAmountLabel = createElement "label"
	foodAmountLabel.innerHTML = "Amount: "
	foodAmountLabel.setAttribute "class", "col-sm-2"

	foodAmountInput = createElement "input"
	foodAmountInput.setAttribute "type", "number"
	foodAmountInput.setAttribute "class", "textfield " + "col-sm-2 " + "col-md-3"
	foodAmountInput.setAttribute "name", "#{name}s[#{name}#{count}[amount]]"

	foodUnitSelect = createElement "select"
	foodUnitSelect.setAttribute "name", "#{name}s[#{name}#{count}[unit]]"

	foodUnits = ["grams", "kilograms"]
	addOptions foodUnitSelect, foodUnits

	newRow.appendChild foodNameLabel
	newRow.appendChild foodNameInput
	newRow.appendChild foodAmountLabel
	newRow.appendChild foodAmountInput
	newRow.appendChild foodUnitSelect

	return newRow

purchasedFoodRow = () ->
	newRow = createElement "div"
	newRow.setAttribute "class", "row"

	foodNameLabel = createElement "label"
	foodNameLabel.innerHTML = "Name: "
	foodNameLabel.setAttribute "class", "col-sm-2"

	nameInput = createElement "input"
	nameInput.setAttribute "type", "text_field"
	nameInput.setAttribute "class", "textfield " + "col-sm-2 " + "col-md-3"
	nameInput.setAttribute "name", "purchased_foods[food#{@purchasedFoodCount}[name]]"

	foodAmountLabel = createElement "label"
	foodAmountLabel.innerHTML = "Amount: "
	foodAmountLabel.setAttribute "class", "col-sm-2"

	amountInput = createElement "input"
	amountInput.setAttribute "type", "number"
	amountInput.setAttribute "class", "textfield " + "col-sm-2 " + "col-md-3"
	amountInput.setAttribute "name", "purchased_foods[food#{@purchasedFoodCount}[amount]]"

	unitSelect = createElement "select"
	unitSelect.setAttribute "name", "purchased_foods[food#{@purchasedFoodCount}[unit]]"

	units = ["grams", "kilograms"]
	for unit in units
		option = createElement "option"
		option.innerHTML = unit
		unitSelect.appendChild option

	foodFrequencyLabel = createElement "label"
	foodFrequencyLabel.innerHTML = "Times: "
	foodFrequencyLabel.setAttribute "class", "col-sm-2"

	frequencyInput = createElement "input"
	frequencyInput.setAttribute "type", "number"
	frequencyInput.setAttribute "class", "textfield " + "col-sm-2 " + "col-md-3"
	frequencyInput.setAttribute "name", "purchased_foods[food#{@purchasedFoodCount}[frequency_amount]]"

	foodTimeUnitLabel = createElement "label"
	foodTimeUnitLabel.innerHTML = "Per: "
	foodTimeUnitLabel.setAttribute "class", "col-sm-2"

	timeSelect = createElement "select"
	timeSelect.setAttribute "name", "purchased_foods[food#{@purchasedFoodCount}[time_unit]]"

	timeUnits = ["day", "week", "two weeks", "month", "year"]
	for unit in timeUnits
		option = createElement "option"
		option.innerHTML = unit
		timeSelect.appendChild option

	newRow.appendChild foodNameLabel
	newRow.appendChild nameInput
	newRow.appendChild foodAmountLabel
	newRow.appendChild amountInput
	newRow.appendChild unitSelect
	newRow.appendChild foodFrequencyLabel
	newRow.appendChild frequencyInput
	newRow.appendChild foodTimeUnitLabel
	newRow.appendChild timeSelect

	return newRow
