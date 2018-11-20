<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar" data-active-color="orange" data-background-color="white" >
            <!--
        Tip 1: You can change the color of active element of the sidebar using: data-active-color="purple | blue | green | orange | red | rose"
        Tip 2: you can also add an image using data-image tag
        Tip 3: you can change the color of the sidebar with data-background-color="white | black"
    -->
            <div class="logo">
                <a href="dashboard" class="simple-text">
                    BookGoals
                </a>
            </div>
            <div class="logo logo-mini">
                <a href="dashboard" class="simple-text">
                    BG
                </a>
            </div>
            <div class="sidebar-wrapper">
                <div class="user">
                    <div class="photo">
                        <img src="resources/img/default-avatar.png" />
                    </div>
                    <div class="info">
                        <a data-toggle="collapse" href="#collapseExample" class="collapsed">
                            Granit Krasniqi
                            <b class="caret"></b>
                        </a>
                        <div class="collapse" id="collapseExample">
                            <ul class="nav">
                                <li>
                                    <a href="#">My Profile</a>
                                </li>
                                <li>
                                    <a href="#">Edit Profile</a>
                                </li>
                                <li>
                                    <a href="#">Settings</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <ul class="nav">
                    <li class="active">
                        <a href="dashboard.html">
                            <i class="material-icons">dashboard</i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="collapse" href="#rezervimetMenu">
                            <i class="material-icons">directions_bus</i>
                            <p>Rezervimet
                                <b class="caret"></b>
                            </p>
                        </a>
                        <div class="collapse" id="rezervimetMenu">
                            <ul class="nav">
                                <li>
                                    <a href="pages/pricing.html">Shiko Rezervimet</a>
                                </li>
                                <li>
                                    <a href="pages/timeline.html">Shto Rezervimin</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a data-toggle="collapse" href="#klientetMenu">
                            <i class="material-icons">person</i>
                            <p>Klientët
                                <b class="caret"></b>
                            </p>
                        </a>
                        <div class="collapse" id="klientetMenu">
                            <ul class="nav">
                                <li id="listoKlientet">
                                    <a href="<c:url value="/klienti">
                                           <c:param name="action" value="listo"/>
                                       </c:url>">Shiko Klientët</a>
                                </li>
                                <li id="shtoKlientin">
                                    <a href="<c:url value="/klienti">
                                           <c:param name="action" value="shto"/>
                                    </c:url>">Shto Klientin</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a data-toggle="collapse" href="#faturatMenu">
                            <i class="material-icons">local_atm</i>
                            <p>Faturat
                                <b class="caret"></b>
                            </p>
                        </a>
                        <div class="collapse" id="faturatMenu">
                            <ul class="nav">
                                <li>
                                    <a href="pages/pricing.html">Shiko Faturat</a>
                                </li>
                                <li>
                                    <a href="pages/timeline.html">Shto Faturën</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <!--
                    <li>
                        <a href="calendar.html">
                            <i class="material-icons">date_range</i>
                            <p>Calendar</p>
                        </a>
                    </li>
                    -->
                </ul>
            </div>
        </div>