<!DOCTYPE html>
<!-- Generated by pkgdown: do not edit by hand --><html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><title>Transform wide format data sets into the long format necessary for eatRep analyses — wideToLong • eatTools</title><script src="../deps/jquery-3.6.0/jquery-3.6.0.min.js"></script><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><link href="../deps/bootstrap-5.3.1/bootstrap.min.css" rel="stylesheet"><script src="../deps/bootstrap-5.3.1/bootstrap.bundle.min.js"></script><link href="../deps/font-awesome-6.5.2/css/all.min.css" rel="stylesheet"><link href="../deps/font-awesome-6.5.2/css/v4-shims.min.css" rel="stylesheet"><script src="../deps/headroom-0.11.0/headroom.min.js"></script><script src="../deps/headroom-0.11.0/jQuery.headroom.min.js"></script><script src="../deps/bootstrap-toc-1.0.1/bootstrap-toc.min.js"></script><script src="../deps/clipboard.js-2.0.11/clipboard.min.js"></script><script src="../deps/search-1.0.0/autocomplete.jquery.min.js"></script><script src="../deps/search-1.0.0/fuse.min.js"></script><script src="../deps/search-1.0.0/mark.min.js"></script><!-- pkgdown --><script src="../pkgdown.js"></script><meta property="og:title" content="Transform wide format data sets into the long format necessary for eatRep analyses — wideToLong"><meta name="description" content="Data from large-scale assessments often are provided in the wide format.
This function easily transform data into the long format required by eatRep."><meta property="og:description" content="Data from large-scale assessments often are provided in the wide format.
This function easily transform data into the long format required by eatRep."><meta property="og:image" content="https://weirichs.github.io/eatTools/logo.png"></head><body>
    <a href="#main" class="visually-hidden-focusable">Skip to contents</a>


    <nav class="navbar navbar-expand-lg fixed-top bg-light" data-bs-theme="light" aria-label="Site navigation"><div class="container">

    <a class="navbar-brand me-2" href="../index.html">eatTools</a>

    <small class="nav-text text-muted me-auto" data-bs-toggle="tooltip" data-bs-placement="bottom" title="">0.7.8.9000</small>


    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div id="navbar" class="collapse navbar-collapse ms-3">
      <ul class="navbar-nav me-auto"><li class="active nav-item"><a class="nav-link" href="../reference/index.html">Reference</a></li>
<li class="nav-item"><a class="nav-link" href="../news/index.html">Changelog</a></li>
      </ul><ul class="navbar-nav"><li class="nav-item"><form class="form-inline" role="search">
 <input class="form-control" type="search" name="search-input" id="search-input" autocomplete="off" aria-label="Search site" placeholder="Search for" data-search-index="../search.json"></form></li>
<li class="nav-item"><a class="external-link nav-link" href="https://github.com/weirichs/eatTools/" aria-label="GitHub"><span class="fa fab fa-github fa-lg"></span></a></li>
      </ul></div>


  </div>
</nav><div class="container template-reference-topic">
<div class="row">
  <main id="main" class="col-md-9"><div class="page-header">
      <img src="../logo.png" class="logo" alt=""><h1>Transform wide format data sets into the long format necessary for eatRep analyses</h1>

      <div class="d-none name"><code>wideToLong.rd</code></div>
    </div>

    <div class="ref-description section level2">
    <p>Data from large-scale assessments often are provided in the wide format.
This function easily transform data into the long format required by eatRep.</p>
    </div>

    <div class="section level2">
    <h2 id="ref-usage">Usage<a class="anchor" aria-label="anchor" href="#ref-usage"></a></h2>
    <div class="sourceCode"><pre class="sourceCode r"><code><span><span class="fu">wideToLong</span> <span class="op">(</span><span class="va">datWide</span>, <span class="va">noImp</span>, <span class="va">imp</span>, multipleColumns <span class="op">=</span> <span class="cn">TRUE</span>, variable.name <span class="op">=</span> <span class="st">"variable"</span>,</span>
<span>            value.name <span class="op">=</span> <span class="st">"value"</span><span class="op">)</span></span></code></pre></div>
    </div>

    <div class="section level2">
    <h2 id="arguments">Arguments<a class="anchor" aria-label="anchor" href="#arguments"></a></h2>
    <p></p>
<dl><dt id="arg-datwide">datWide<a class="anchor" aria-label="anchor" href="#arg-datwide"></a></dt>
<dd><p><!-- %%     ~~Describe \code{file} here~~ -->
Data set in the wide format, i.e. one row per person</p></dd>

  <dt id="arg-noimp">noImp<a class="anchor" aria-label="anchor" href="#arg-noimp"></a></dt>
<dd><p><!-- %%     ~~Describe \code{file} here~~ -->
character vector of non-imputed variables which are desired for following analyses</p></dd>

  <dt id="arg-imp">imp<a class="anchor" aria-label="anchor" href="#arg-imp"></a></dt>
<dd><p><!-- %%     ~~Describe \code{file} here~~ -->
Named list of character vectors which include the imputed variables which are desired for following analyses</p></dd>

  <dt id="arg-multiplecolumns">multipleColumns<a class="anchor" aria-label="anchor" href="#arg-multiplecolumns"></a></dt>
<dd><p>Logical: use one column for each imputed variable (if more than one imputed variable is used)?
Alternatively, only one column for all imputed variables is used (this is the default behavior
of the <code>melt</code> function from the <code>reshape2</code> package).</p></dd>

  <dt id="arg-variable-name">variable.name<a class="anchor" aria-label="anchor" href="#arg-variable-name"></a></dt>
<dd><p>Applies only if <code>multipleColumns = "FALSE"</code>: name of variable used to store measured variable names</p></dd>

  <dt id="arg-value-name">value.name<a class="anchor" aria-label="anchor" href="#arg-value-name"></a></dt>
<dd><p>Applies only if <code>multipleColumns = "FALSE"</code>: name of variable used to store values</p></dd>

</dl></div>
    <div class="section level2">
    <h2 id="value">Value<a class="anchor" aria-label="anchor" href="#value"></a></h2>
    <p>A data.frame in the long format.</p>
    </div>
    <div class="section level2">
    <h2 id="author">Author<a class="anchor" aria-label="anchor" href="#author"></a></h2>
    <p>Sebastian Weirich</p>
    </div>

    <div class="section level2">
    <h2 id="ref-examples">Examples<a class="anchor" aria-label="anchor" href="#ref-examples"></a></h2>
    <div class="sourceCode"><pre class="sourceCode r"><code><span class="r-in"><span><span class="co">### create arbitrary wide format large-scale assessment data for two</span></span></span>
<span class="r-in"><span><span class="co">### subjects, each with three imputations</span></span></span>
<span class="r-in"><span><span class="va">datWide</span> <span class="op">&lt;-</span> <span class="fu"><a href="https://rdrr.io/r/base/data.frame.html" class="external-link">data.frame</a></span> <span class="op">(</span> id <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/paste.html" class="external-link">paste0</a></span><span class="op">(</span><span class="st">"P"</span>,<span class="fl">1</span><span class="op">:</span><span class="fl">5</span><span class="op">)</span>, weight <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/MathFun.html" class="external-link">abs</a></span><span class="op">(</span><span class="fu"><a href="https://rdrr.io/r/stats/Normal.html" class="external-link">rnorm</a></span><span class="op">(</span><span class="fl">5</span>,<span class="fl">10</span>,<span class="fl">1</span><span class="op">)</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>           country <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="st">"USA"</span>, <span class="st">"BRA"</span>, <span class="st">"TUR"</span>, <span class="st">"GER"</span>, <span class="st">"AUS"</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>           sex <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/factor.html" class="external-link">factor</a></span><span class="op">(</span><span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="st">"female"</span>, <span class="st">"male"</span>, <span class="st">"female"</span>, <span class="st">"female"</span>, <span class="st">"male"</span><span class="op">)</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>           <span class="fu"><a href="https://rdrr.io/r/base/matrix.html" class="external-link">matrix</a></span><span class="op">(</span>data <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/stats/Normal.html" class="external-link">rnorm</a></span><span class="op">(</span>n<span class="op">=</span><span class="fl">15</span>, mean <span class="op">=</span> <span class="fl">500</span>, sd <span class="op">=</span> <span class="fl">75</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>                  nrow<span class="op">=</span><span class="fl">5</span>, dimnames <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/list.html" class="external-link">list</a></span><span class="op">(</span><span class="cn">NULL</span>, <span class="fu"><a href="https://rdrr.io/r/base/paste.html" class="external-link">paste0</a></span><span class="op">(</span><span class="st">"mat.pv"</span>, <span class="fl">1</span><span class="op">:</span><span class="fl">3</span><span class="op">)</span><span class="op">)</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>           <span class="fu"><a href="https://rdrr.io/r/base/matrix.html" class="external-link">matrix</a></span><span class="op">(</span>data <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/stats/Normal.html" class="external-link">rnorm</a></span><span class="op">(</span>n<span class="op">=</span><span class="fl">15</span>, mean <span class="op">=</span> <span class="fl">480</span>, sd <span class="op">=</span> <span class="fl">80</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>                  nrow<span class="op">=</span><span class="fl">5</span>, dimnames <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/list.html" class="external-link">list</a></span><span class="op">(</span><span class="cn">NULL</span>, <span class="fu"><a href="https://rdrr.io/r/base/paste.html" class="external-link">paste0</a></span><span class="op">(</span><span class="st">"sci.pv"</span>, <span class="fl">1</span><span class="op">:</span><span class="fl">3</span><span class="op">)</span><span class="op">)</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>           stringsAsFactors<span class="op">=</span><span class="cn">FALSE</span><span class="op">)</span></span></span>
<span class="r-in"><span><span class="va">datLong</span> <span class="op">&lt;-</span> <span class="fu">wideToLong</span><span class="op">(</span>datWide <span class="op">=</span> <span class="va">datWide</span>, noImp <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="st">"id"</span>, <span class="st">"weight"</span>, <span class="st">"country"</span>, <span class="st">"sex"</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>             imp <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/list.html" class="external-link">list</a></span> <span class="op">(</span> math <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/paste.html" class="external-link">paste0</a></span><span class="op">(</span><span class="st">"mat.pv"</span>, <span class="fl">1</span><span class="op">:</span><span class="fl">3</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>                   science <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/paste.html" class="external-link">paste0</a></span><span class="op">(</span><span class="st">"sci.pv"</span>, <span class="fl">1</span><span class="op">:</span><span class="fl">3</span><span class="op">)</span><span class="op">)</span><span class="op">)</span></span></span>
<span class="r-in"><span><span class="va">datLong2</span><span class="op">&lt;-</span> <span class="fu">wideToLong</span><span class="op">(</span>datWide <span class="op">=</span> <span class="va">datWide</span>, noImp <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="st">"id"</span>, <span class="st">"weight"</span>, <span class="st">"country"</span>, <span class="st">"sex"</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>             imp <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/list.html" class="external-link">list</a></span> <span class="op">(</span> math <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/paste.html" class="external-link">paste0</a></span><span class="op">(</span><span class="st">"mat.pv"</span>, <span class="fl">1</span><span class="op">:</span><span class="fl">3</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>                   science <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/paste.html" class="external-link">paste0</a></span><span class="op">(</span><span class="st">"sci.pv"</span>, <span class="fl">1</span><span class="op">:</span><span class="fl">3</span><span class="op">)</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>             multipleColumns <span class="op">=</span> <span class="cn">FALSE</span>, variable.name <span class="op">=</span> <span class="st">"varName"</span>,</span></span>
<span class="r-in"><span>             value.name <span class="op">=</span> <span class="st">"val"</span><span class="op">)</span></span></span>
</code></pre></div>
    </div>
  </main><aside class="col-md-3"><nav id="toc" aria-label="Table of contents"><h2>On this page</h2>
    </nav></aside></div>


    <footer><div class="pkgdown-footer-left">
  <p>Developed by Sebastian Weirich, Martin Hecht, Karoline Sachse, Benjamin Becker, Nicole Mahler.</p>
</div>

<div class="pkgdown-footer-right">
  <p>Site built with <a href="https://pkgdown.r-lib.org/" class="external-link">pkgdown</a> 2.1.1.</p>
</div>

    </footer></div>





  </body></html>

