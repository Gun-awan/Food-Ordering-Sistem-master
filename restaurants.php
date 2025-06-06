<!DOCTYPE html>
<html lang="en">
<?php
include("connection/connect.php");
error_reporting(0);
session_start();
?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">
    <title>Online Food Order</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animsition.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
</head>

<body>
    <!--header starts-->
    <?php include("includes/navbar.php") ?>
    <!-- header end -->

    <div class="page-wrapper">
        <!-- top Links -->
        <div class="top-links">
            <div class="container">
                <ul class="row links">
                    <li class="col-xs-12 col-sm-4 link-item active"><span>1</span><a href="restaurants.php">Choose Restaurant</a></li>
                    <li class="col-xs-12 col-sm-4 link-item"><span>2</span><a href="#">Pick Your favorite food</a></li>
                    <li class="col-xs-12 col-sm-4 link-item"><span>3</span><a href="#">Order and Pay online</a></li>
                </ul>
            </div>
        </div>
        <!-- end:Top links -->
        <!-- start inner page hero -->
        <div class="inner-page-hero bg-image" data-image-src="images/makanan2.jpg" style="background-position: bottom;">
            <div class="container"> </div>
            <!-- end:Container -->
        </div>
        <section class="featured-restaurants">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="title-block pull-left">
                            <h4 class="title">Choose Your favorite Restaurants</h4>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <!-- restaurants filter nav starts -->
                        <div class="restaurants-filter pull-right">
                            <nav class="primary pull-left">
                                <ul>
                                    <li><a href="#" class="selected" data-filter="*">all</a> </li>
                                    <?php
                                    $res = mysqli_query($db, "select * from res_category");
                                    while ($row = mysqli_fetch_array($res)) {
                                        echo '<li><a href="#" data-filter=".' . $row['c_name'] . '"> ' . $row['c_name'] . '</a> </li>';
                                    }
                                    ?>
                                </ul>
                            </nav>
                        </div>
                        <!-- restaurants filter nav ends -->
                    </div>
                </div>
                <!-- restaurants listing starts -->
                <div class="row">
                    <div class="restaurant-listing">
                        <?php
                        $ress = mysqli_query($db, "select * from restaurant");
                        while ($rows = mysqli_fetch_array($ress)) {
                            $query = mysqli_query($db, "select * from res_category where c_id='" . $rows['c_id'] . "' ");
                            $rowss = mysqli_fetch_array($query);
                            echo '<div class="col-xs-12 col-sm-12 col-md-6 single-restaurant all ' . $rowss['c_name'] . '">
									<div class="restaurant-wrap">
										<div class="row">
											<div class=" col-xs-12 col-sm-3 col-md-12 col-lg-3 text-xs-center">
												<a class="restaurant-logo" href="dishes.php?res_id=' . $rows['rs_id'] . '" > <img src="admin/Res_img/' . $rows['image'] . '" alt="Restaurant logo"> </a>
											</div>
											<!--end:col -->
											<div class="col-xs-12 col-sm-9 col-md-12 col-lg-9">
												<h5><a href="dishes.php?res_id=' . $rows['rs_id'] . '" >' . $rows['title'] . '</a></h5> <span>' . $rows['address'] . '</span>
												<div class="bottom-part">
													<div class="cost"><i class="fa fa-check"></i> Min Rp.30000</div>
													<div class="mins"><i class="fa fa-motorcycle"></i> 30 min</div>
													<div class="ratings" > 
                                                        <span">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
														</span> (122) 
                                                    </div>
												</div>
											</div>
											<!-- end:col -->
										</div>
										<!-- end:row -->
									</div>
									<!--end:Restaurant wrap -->
								</div>';
                        }


                        ?>

                    </div>
                </div>
                <!-- restaurants listing ends -->
            </div>
        </section>

        <!-- FOOTER SECTION ----------------------- -->
        <?php include("includes/footer.php"); ?>
        <!-- FOOTER SECTION END----------------- -->

    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/animsition.min.js"></script>
    <script src="js/bootstrap-slider.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/headroom.js"></script>
    <script src="js/foodpicky.min.js"></script>
</body>

</html>