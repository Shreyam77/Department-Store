
function search()
{
	//data to be searched for
	var filter = document.getElementById('searchName').value.toUpperCase().trim();
	let myTable = document.getElementById('myTable');
	
	let tr = myTable.getElementsByTagName('tr');
	let f = 0;
	for(var i=0 ; i<tr.length ; i++)
	{
		//list of data from where we have to search
		let td = tr[i].getElementsByTagName('td')[1];
		
		if(td)
		{
			let textValue = td.textContent || td.innerHTML ;
			if(textValue.toUpperCase().indexOf(filter) > -1)
			{
				//Displaying search results
				tr[0].style.display = "" ;
				f = 1;				
			}
			else
			{
				tr[i].style.display = "none";
			}

		}
	}
	if(f==0)
	{
		alert("No Records Found with that name");
		document.location.reload (); 
	}	

	
}