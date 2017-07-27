
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Header -->
<header id="top" class="header fixed-bg">
	<div class="text-vertical-center">
		<h1>Start Bootstrap</h1>
		<h3>Free Bootstrap Themes &amp; Templates</h3>
		<br> <a href="#about" class="btn btn-dark btn-lg">Find Out
			More</a>
	</div>
</header>

<!-- About -->
<section id="about" class="about">
	<div class="white-circle"></div>
	<div class="container">
		<!-- Team Members Row -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Tâm Thanh Tinh</h2>
			</div>

			<c:forEach items="${categorys}" var="category">
				<a href="#${category.name}">
					<div class="col-lg-2  text-center slidehidden">
						<img class="img-circle img-responsive img-center"
							src="${category.backgroundURL}" alt="${category.title}"
							style="width: 200px; height: 170px;">
						<h3>${category.title}
							<small>Job Title</small>
						</h3>

					</div>
				</a>
			</c:forEach>


		</div>
	</div>
	<!-- /.container -->
</section>

<!-- Category -->
<!-- shơw all category -->
<c:set scope="request" var="boole" value="1" />
<c:forEach items="${categorys}" var="category">
<style>
		.${category.name}{ 
		height: 500px;
 		background: url(${category.backgroundURL}) no-repeat center center scroll; */
		-webkit-background-size: cover; 
		-moz-background-size: cover; 
		background-size: cover; 
 		-o-background-size: cover; 
 	} 
</style>

	<section id="${category.name}" class="${category.name}">
		<div width="100%" height="100%">
			<div class="container">
				<!-- Team Members Row -->
				<div class="row">
				<c:if test="${boole == 1}"><div class="col-lg-6"></div></c:if>
				<c:set scope="request" var="boole" value="${boole*(-1)}" />	
					
					<div class="col-lg-6">
					
						<h2 class="page-header">${category.title}</h2>
						<p>${category.description}
						<p>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container -->
	</section>
</c:forEach>

<section id="services" class="services bg-primary">
	<div class="container">
		<div class="row text-center">
			<div class="col-lg-10 col-lg-offset-1">
				<h2>Our Services</h2>
				<hr class="small">
				<div class="row">
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="fa-stack fa-4x"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-cloud fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>Service Name</strong>
							</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<a href="#" class="btn btn-light">Learn More</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="fa-stack fa-4x"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-compass fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>Service Name</strong>
							</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<a href="#" class="btn btn-light">Learn More</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="fa-stack fa-4x"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-flask fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>Service Name</strong>
							</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<a href="#" class="btn btn-light">Learn More</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="fa-stack fa-4x"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-shield fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>Service Name</strong>
							</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<a href="#" class="btn btn-light">Learn More</a>
						</div>
					</div>
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.col-lg-10 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</section>

<!-- Callout -->
<aside class="callout">
	<div class="text-vertical-center">
		<h1>Vertically Centered Text</h1>
	</div>
</aside>

<!-- Portfolio -->
<section id="portfolio" class="portfolio">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1 text-center">
				<h2>Our Work</h2>
				<hr class="small">
				<div class="row">
					<div class="col-md-6">
						<div class="portfolio-item">
							<a href="#"> <img class="img-portfolio img-responsive"
								src="img/portfolio-1.jpg">
							</a>
						</div>
					</div>
					<div class="col-md-6">
						<div class="portfolio-item">
							<a href="#"> <img class="img-portfolio img-responsive"
								src="img/portfolio-2.jpg">
							</a>
						</div>
					</div>
					<div class="col-md-6">
						<div class="portfolio-item">
							<a href="#"> <img class="img-portfolio img-responsive"
								src="img/portfolio-3.jpg">
							</a>
						</div>
					</div>
					<div class="col-md-6">
						<div class="portfolio-item">
							<a href="#"> <img class="img-portfolio img-responsive"
								src="img/portfolio-4.jpg">
							</a>
						</div>
					</div>
				</div>
				<!-- /.row (nested) -->
				<a href="#" class="btn btn-dark">View More Items</a>
			</div>
			<!-- /.col-lg-10 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</section>

<!-- Call to Action -->
<aside class="call-to-action bg-primary">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h3>The buttons below are impossible to resist.</h3>
				<a href="#" class="btn btn-lg btn-light">Click Me!</a> <a href="#"
					class="btn btn-lg btn-dark">Look at Me!</a>
			</div>
		</div>
	</div>
</aside>

<!-- Map -->
<section id="contact" class="map">
	<iframe width="100%" height="100%" frameborder="0" scrolling="no"
		marginheight="0" marginwidth="0"
		src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
	<br /> <small> <a
		href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
	</small>
</section>

<!-- Footer -->

