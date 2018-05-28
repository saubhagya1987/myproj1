
/*** Common Function For Value Slider Starts ***/

function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox) {

    $(ctrlName).slider({
        min: minVal,
        max: maxVal,
        step: stepBy,
        slide: function (event, ui) {
            $(ctrlTextBox).val(ui.value);
			
        }
    });
    $(ctrlTextBox).val($(ctrlName).slider("value"));

    $(ctrlTextBox).keyup(function () {
        $(ctrlTextBox).val();
        $(ctrlName).slider('value', $(ctrlTextBox).val());
    });
	
}

/*** Common Function For Value Slider Ends ***/


