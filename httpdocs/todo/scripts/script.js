
/* ----- Local Storage Object  ----- */

var store = {};
store.tasks = {};
store.maxID = 0;

store.incrementID = function(){
	this.maxID++;
	console.log('The maxID was incremented to: ' + this.maxID);
};

store.newItem = function( item ) {
	item.id = ++this.maxID;
	store.tasks.append( item );
}



/* ----- Title Object  ----- */

var _title = function(text){
	this.value = text;
}

/* ----- Description Object  ----- */

var _description = function(text){
	this.value = text;

	this.render = function() {
		return parseDodgy( this.value );
	}
}


/* ----- Status Object  ----- */

var _status = function(text){
	this.value = text;
}

/* ----- ID Object  ----- */

var _id = function(number){
	console.log('assigned new id: ' + number);
	this.value = number;

}




/* ----- Task object ----- */

var task = function(titleText, descriptionText, statusText){
	
	this.title = new _title( titleText );
	this.description = new _description( descriptionText );
	this.status = new _status( statusText );

	store.newItem( this );

	this.getNewID = function(){
		return store.getMaxID() + 1;
	}

	this.id = new _id( this.getNewID() );

	this.save = function(){
		store['tasks'][this.id] = this;
		store.incrementID();
	}

	this.render = function() {

		output = '';
		output += this.title.render();
		output += this.description.render();

		$(element).html(output);
	}

}



var task1 = new task('Write app', 'Adhere to object calisthenics rules','Started');
console.log(task1);
task1.save();

console.log('===Object completed===')


var task2 = new task('Eat Cake', 'The cake is delicious and not fictional','Not Started');
console.log(task2);
task2.save();


console.log( store );


/* ----- Page On Load ----- */

$(document).ready(function(){


	init();


	var htmlString = '<table class="table table-striped table-hover"><thead><tr><th>ID</th><th>Title</th><th>Description</th><th>Status</th></tr></thead><tbody>';

	for(task in store['tasks']){

		htmlString += buildRow(store['tasks'][task]);
	}

	htmlString += '</tbody></table>';

	$('div.tasksTable').append(htmlString);

});


buildRow = function(task){

	var returnString =	'<tr class="task">' + 
						'<td class="id">' + task['id']['value'] + '</td>' + 
						'<td class="title">' + task['title']['value'] + '</td>' + 
						'<td class="description">' + task['description']['value'] + '</td>' + 
						'<td class="status">' + task['status']['value'] + '</td></tr>';

	return returnString;

}



/* ----- Page ui elements ----- */


$('button.addTask').click(function(event) {

});





