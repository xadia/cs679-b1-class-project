{include file='header.tpl'}

<div id="header_wrap{if !$homepage}_secondary{/if}">
	<div id="header{if $secondary}_secondary{/if}"><!-- begin header -->
		{include file='upperheader.tpl' user=$user}
	  
	  	{include file='lowerheader.tpl' title='Charts' message='Vizualise your data'}
	</div><!-- end header -->
</div>

<div id="page{if !$homepage}_secondary{/if}"><!-- start page content -->
          
	<div id="main_content">
		{include file="leftnav.tpl" active='Chart'}
	
		<div id="main_content_left_secondary">
       		<div id="pie_chart_div" style="width:400px; height:300px"></div>
		</div><!-- end main content left  -->
      		<!-- end main content right  -->
    </div> <!-- end main content  -->
	<div style="clear: both;">&nbsp;</div>       
          
</div>
<div class="push"></div>

{literal}
<script type="text/javascript">
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var jsonData = $.ajax({
			url: base_url + "/chart.php?func=getData&chart=pie",
			dataType:"json",
			async: false}).responseText;
		var data = new google.visualization.DataTable(jsonData);
		var chart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
		var formatter = new google.visualization.NumberFormat({prefix: '$', negativeColor: 'red', negativeParens: true});
		formatter.format(data, 1);
		var options = {
          title: 'Past 6 Months Spending',
          allowHtml: true,
          width: 400,
          height: 300
        };
		chart.draw(data, options);
	}
</script>
{/literal}

{include file='footer.tpl'}