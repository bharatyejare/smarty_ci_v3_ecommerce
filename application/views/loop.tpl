<html>
<body>
<p><strong>Personal Application Form</strong></p>
<form name="person_form" id="person_form" method="post" action={$url} onsubmit="return validationFunction()">
{block name=head}
  <link href="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/>
  <script>
  function get_states(){
  var countryID = document.getElementById('country').value;
  
  if (countryID.length == 0) {
    document.getElementById("state").innerHTML = "";
    return;
  } else {
  //alert(countryID.length);
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
      // var s = '<option value="-1">Select State</option>'; 
       document.getElementById("state").innerHTML = this.responseText;
        
      }
    };
    xmlhttp.open("GET", "welcome/getStates?country_id=" + countryID, true);
    xmlhttp.send();
  }
}

function get_city(){
  var stateid = document.getElementById('state').value;
  //alert(stateid);
  if (stateid.length == 0) {
    document.getElementById("city").innerHTML = "";
    return;
  } else {
  //alert(stateid.length);
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
      // var s = '<option value="-1">Select City</option>'; 
       document.getElementById("city").innerHTML = this.responseText;
        
      }
    };
    xmlhttp.open("GET", "welcome/getcitites?state_id=" + stateid, true);
    xmlhttp.send();
  }
}

function validationFunction(){
   $("#person_form").submit();
}

</script>
<p></p>
Name-
<input name="name" type="text" id="nmame" value="">
<p></p>
Country-
<select name="country" id="country" onclick="get_states()">
<option>--Select--</option>
{foreach item=country2 from=$countries}
   <option value="{$country2.id}" {if $country2.id eq '1'}{/if}> {$country2.country_name} </option>
{/foreach}
</select>
<p></p>
States-
<select name="state" id="state" onclick="get_city()">
</select>
<p></p>
Cities-
<select name="city" id="city" >
</select>
<p></p>
<input type ="submit" name = "submit" value = "Submit" />
{/block}
</form>
</body>
</html>