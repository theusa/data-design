<!DOCTYPE html>
<html lang = "en">

<head>
    <meta charset="UTF-8">
    <title>Conceptual Model</title>
</head>
<body>
<h1>Conceptual Model</h1>

    <h2>Profile</h2>
    <ul>
        <li>profileId</li>
        <li>profileActivationToken</li>
        <li>profileEmail</li>
        <li>profileHash</li>
    </ul>

    <h2>Item Results</h2>
    <ul>
        <li>itemTitle</li>
        <li>itemId</li>
        <li>itemPrice</li>
        <li>itemPicture</li>
        <li>itemDate</li>
    </ul>

    <h2>Reviews</h2>
    <ul>
        <li>reviewProfileId</li>
        <li>reviewStars</li>
        <li>reviewCount</li>
        <li>reviewAggregate</li>
    </ul>

        <h2>Relations</h2>
    <ul>
        <li>One <strong> Profile </strong> can obtain many <strong>Item Results</strong> (1 to many)</li>
        <li>Many <strong>Item Results</strong> can be reviewed by many <strong>Profiles (many to many) </strong></li>
    </ul>

<img src="data-design_diagam_take_2.jpg" alt= "ERD" />

<p> Check out her <a href = persona.php><strong>Persona</strong></a></p>
<p>Also check out her <a href = user-story.php><strong>Story</strong></a>.</p>
<p>And <a href = use-case-interaction.php/> <strong>here</strong></a> is how she interacts with Amazon.</p>



</body>
</html>
