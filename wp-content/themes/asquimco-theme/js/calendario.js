var actual=new Date();

function mostrarCalendario(year,month)

{

	var now=new Date(year,month-1,1);

	var last=new Date(year,month,0);

	var primerDiaSemana=(now.getDay()==0)?7:now.getDay();

	var ultimoDiaMes=last.getDate();

	var dia=0;

	var resultado="<tr>";

	var diaActual=0;

 

	var last_cell=primerDiaSemana+ultimoDiaMes;

 

	// hacemos un bucle hasta 42, que es el máximo de valores que puede

	// haber... 6 columnas de 7 dias

	for(var i=1;i<=42;i++)

	{

		if(i==primerDiaSemana)

		{

			// determinamos en que dia empieza

			dia=1;

		}

		if(i<primerDiaSemana || i>=last_cell)

		{

			// celda vacia

			resultado+="<td>&nbsp;</td>";

		}else{

			// mostramos el dia

			if(dia==actual.getDate() && month==actual.getMonth()+1 && year==actual.getFullYear())

				resultado+="<td class='hoy'>"+dia+"</td>";

			else

				resultado+="<td>"+dia+"</td>";

			dia++;

		}

		if(i%7==0)

		{

			if(dia>ultimoDiaMes)

				break;

			resultado+="</tr><tr>\n";

		}

	}

	resultado+="</tr>";

 

	var meses=Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");

 

	// Calculamos el siguiente mes y año

	nextMonth=month+1;

	nextYear=year;

	if(month+1>12)

	{

		nextMonth=1;

		nextYear=year+1;

	}

 

	// Calculamos el anterior mes y año

	prevMonth=month-1;

	prevYear=year;

	if(month-1<1)

	{

		prevMonth=12;

		prevYear=year-1;

	}

 
	if( document.getElementById("calendario") != null )
	{
		document.getElementById("calendario").getElementsByTagName("caption")[0].innerHTML="<div class='div-paddings-0px col-md-12 col-lg-12'>"+
		"<div id='arrowLeft' class='col-md-2 col-lg-2' style='transform: scaleY(2.0);margin-top: 4%;'><a onclick='mostrarCalendario("+prevYear+","+prevMonth+")'><span class='glyphicon glyphicon-chevron-left '></span></a></div>"+
		"<div id='calendarDay' class='div-paddings-0px col-md-4 col-lg-4'>"+actual.getDate()+"</div>"+
		"<div id='calendarMonth' class='div-paddings-0px col-md-4 col-lg-4 text-center'><span class='mes'>"+meses[month-1]+"</span><br><span class='anio'>"+year+"</span></div>"+
		"<div id='arrowRight' class='col-md-2 col-lg-2' style='transform: scaleY(2.0);margin-top: 4%;'><a onclick='mostrarCalendario("+nextYear+","+nextMonth+")'><span class='glyphicon glyphicon-chevron-right '></span></a></div>"+
		"</div>";
	
		document.getElementById("calendario").getElementsByTagName("tbody")[0].innerHTML=resultado;
	}

}

 

mostrarCalendario(actual.getFullYear(),actual.getMonth()+1);
