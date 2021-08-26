<h1>Plate Up Web App</h1>
View demo here: https://safe-fortress-70348.herokuapp.com/
<p>"Plate Up" is my first database backed web application. I made this for intents and purposes of personal use to keep track of my progress at the gym. Most of the time I have trouble remembering what certain exercises look like and what weight I used. I go to two different gyms, one with a personal trainer I've been with for almost 4 years and another gym where I take classes I enjoy. My goal to do exercise weight-based training at both gyms. </p>
<p> This app is to help me and others keep track of their exercises everytime they go to the gym and to also present information when they do hit their all-time high. </p>

<h2>Technologies Used</h2>
<ul>
  <li>Sinatra</li>
  <li>BCrypt</li>
  <li>Pry</li>
  <li>PSQL/PG; as my database</li>
  <li>Heroku; used to deploy and allow others to access</li>
</ul>

<h2>Approach Taken</h2>
<p>First, I drafted a data model to get an idea of how I was going to set everything up</p> 
<p>Which looks like this: https://i.imgur.com/vyUIG8l.png</p>
<p>Instead of 3 tables having relations to each other. I've decided to just use 2 tables that are connected(Users and their logs) and one seperate table (List of Exercises with a url image)</p>
<br>
<p>Once I have figured tables I was going to make, i drew up a very rough wireframe of how I wanted my website; more particularly how I wanted to present all my information. I got some inspiration from MyFitnessPal to help me lay out the sign in and sign up.</p>
<p>Links:</p>
<ul> 
  <li>https://i.imgur.com/MLTmedc.jpg</li>
  <li>https://i.imgur.com/x9KCcSF.jpg </li>
 </ul>

<br>
<p>Once that was done, I started to build my with setting up log in and sign up, then navigation bar and then slowly branched out to pages that the nav links sent me to step by step.</p>
<p>I have used RESTful routes as appropriately as possible. My app includes read, create, update and delete routes</p>
<br>
<br>
<p>After all my server side code was written and tested multiple times, I worked on the styling and came up with a LOGO for my website.</p>
<p>Logo: https://i.imgur.com/8v8wdhQ.png </p>

<h2>Future Developments</h2>
<p> At the moment, I only have 5 exercises that can be selected. I would like to explain this and allow users to personalise and add their own exercises.</p> 
<p>Also wish to personalise it a bit more i.e. users can upload a profile image</p>
<p>Other things: </p>
<ul>
  <li>Display information in a different way i.e. charts, graphs etc.</li>
  <li>Allow users to track and log in their bodyweight, muscle mass and body fat %</li>
</ul>



