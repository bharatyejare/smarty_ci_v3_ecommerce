<html>
<head>
<title> Homepage </title>
</head>
<body>
Using html_options: 

<select name="user">
{html_options values=$id output=$names selected="1"}
</select>
<p></p>

Using section:

<select name="country">
{section name="getCountry" loop=$country}
<option value="{$country[getCountry].country_id}" {if $country[getCountry].country_id eq '1'}selected{/if}>{$country[getCountry].country_name} </option>
{/section}
</select>
<p></p>

Using foreach:

<select name="country2">
{foreach item=country2 from=$country}
   <option value="{$country2.country_id}" {if $country2.country_id eq '1'}selected{/if}> {$country2.country_name} </option>
{/foreach}
</select>
<p></p>
while loop:
{while $count>1}
{$count--}
{/while}
<p></p>
Foreach If Else else if
<p></p>
{foreach $names as $value}
{if isset($value) && $value == "Bharat"}
	Welcome Sir.
{elseif $value == "Yejare"}
	Welcome Ma'am.
{else}
	Welcome, whatever you are.
{/if}
{/foreach}
</body>
</html>

{if isset($success_message) && $success_message == "TRUE"}
	DATA Inserted Successfully.
	//window.location.replace("http://localhost/smarty_template_engine/index.php/loop");
{/if}