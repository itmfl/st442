---
title: "Reshaping data"
subtitle: "tidyr and relational data with dplyr"
author: "CSC/ST 442"
date: "Fall 2019"
output:
  xaringan::moon_reader:
    lib_dir: libs
    css: [default, metropolis, metropolis-fonts]
    nature:
      highlightStyle: zenburn
      highlightLines: true
      countIncrementalSlides: false
    df_print: tibble

--- 




#Tidy Data
Consider the following four different representations of the same data.


.pull-left[
<table class="table table-striped" style="font-size: 14px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">Table 1</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> country </th>
   <th style="text-align:right;"> year </th>
   <th style="text-align:right;"> cases </th>
   <th style="text-align:right;"> population </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 745 </td>
   <td style="text-align:right;"> 2.00e+07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2666 </td>
   <td style="text-align:right;"> 2.06e+07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 37737 </td>
   <td style="text-align:right;"> 1.72e+08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 80488 </td>
   <td style="text-align:right;"> 1.75e+08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 212258 </td>
   <td style="text-align:right;"> 1.27e+09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 213766 </td>
   <td style="text-align:right;"> 1.28e+09 </td>
  </tr>
</tbody>
</table>
]
.pull-right[
<table class="table table-striped" style="font-size: 14px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">Table 2</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> country </th>
   <th style="text-align:right;"> year </th>
   <th style="text-align:left;"> type </th>
   <th style="text-align:right;"> value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> cases </td>
   <td style="text-align:right;"> 7.45e+02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> population </td>
   <td style="text-align:right;"> 2.00e+07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> cases </td>
   <td style="text-align:right;"> 2.67e+03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> population </td>
   <td style="text-align:right;"> 2.06e+07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> cases </td>
   <td style="text-align:right;"> 3.77e+04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> population </td>
   <td style="text-align:right;"> 1.72e+08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> cases </td>
   <td style="text-align:right;"> 8.05e+04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> population </td>
   <td style="text-align:right;"> 1.75e+08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> cases </td>
   <td style="text-align:right;"> 2.12e+05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> population </td>
   <td style="text-align:right;"> 1.27e+09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> cases </td>
   <td style="text-align:right;"> 2.14e+05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> population </td>
   <td style="text-align:right;"> 1.28e+09 </td>
  </tr>
</tbody>
</table>
]
---
class: clear
.pull-left[
<table class="table table-striped" style="font-size: 14px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">Table 3</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> country </th>
   <th style="text-align:right;"> year </th>
   <th style="text-align:left;"> rate </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> 745/19987071 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> 2666/20595360 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> 37737/172006362 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> 80488/174504898 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> 212258/1272915272 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> 213766/1280428583 </td>
  </tr>
</tbody>
</table>
]
.pull-right[
<table class="table table-striped" style="font-size: 14px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">Table 4a</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> country </th>
   <th style="text-align:right;"> 1999 </th>
   <th style="text-align:right;"> 2000 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 745 </td>
   <td style="text-align:right;"> 2666 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 37737 </td>
   <td style="text-align:right;"> 80488 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 212258 </td>
   <td style="text-align:right;"> 213766 </td>
  </tr>
</tbody>
</table>

<table class="table table-striped" style="font-size: 14px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">Table 4b</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> country </th>
   <th style="text-align:right;"> 1999 </th>
   <th style="text-align:right;"> 2000 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 2.00e+07 </td>
   <td style="text-align:right;"> 2.06e+07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 1.72e+08 </td>
   <td style="text-align:right;"> 1.75e+08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 1.27e+09 </td>
   <td style="text-align:right;"> 1.28e+09 </td>
  </tr>
</tbody>
</table>
]

<br>
<br> 
The above tables, while representing the same data, are not equally easy to use. 
For example, table $4a$ provides the simplest way for finding the difference in the number of cases between $1999$ and $2000$. Table $1$ is the easiest table to add new variables such as $\mathrm{GDP}$. Table $3$ is not particularly suitable for data analysis, but is possibly useful for data collection. Table $2$ is appropriate if the columns of Table $1$, instead of being *cases* and *populations*, are e.g., *diabetes*, *HIV*, *colon cancer*, ... for which there is possibly missing/unobserved data (that is not all diseases are surveyed for every country). 
---
#gather() and spread()
There is often a need to transform data between two different representations exemplified by Table $1$ and Table $2$ in the previous slide. The main tool for doing so are the verbs **gather** and **spread** that are part of the **tidyr** library.  For a thoughtful discussion of the motivations behind **tidyr**, see the article [Tidy Data](https://www.jstatsoft.org/article/view/v059i10) by Hadley Wickham. 

To convert from Table $1$ to Table $2$, we do

```r
table2 <- gather(table1, key = "type", value = "value", cases, population)
```

Conversely, to convert from Table $2$ to Table $1$, we do

```r
table1 <- spread(table2, type, value)
```

---
class: clear
The idea behind *gather* and *spread* is best described by the following graphic; in particular, *gather* makes "wide" data "longer" while *spread* makes "long" data "wider".

<img src="figures/tidyr.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="120%" style="display: block; margin: auto;" />

---
class: clear
As another example, consider the following two representations of table $4a$.

```r
table4a %>% gather(key = "year", value = "cases", `1999`, `2000`) %>% 
  arrange(country, year)
```

```
## # A tibble: 6 x 3
##   country     year   cases
##   <chr>       <chr>  <dbl>
## 1 Afghanistan 1999     745
## 2 Afghanistan 2000    2666
## 3 Brazil      1999   37737
## 4 Brazil      2000   80488
## 5 China       1999  212258
## 6 China       2000  213766
```

```r
table4a %>% gather(key = "year", value = "cases", `1999`, `2000`) %>% 
  spread(year, cases)
```

```
## # A tibble: 3 x 3
##   country     `1999` `2000`
##   <chr>        <dbl>  <dbl>
## 1 Afghanistan    745   2666
## 2 Brazil       37737  80488
## 3 China       212258 213766
```
