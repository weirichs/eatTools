<!DOCTYPE html>
<!-- Generated by pkgdown: do not edit by hand --><html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><title>Recode a variable according to a lookup table — recodeLookup • eatTools</title><script src="../deps/jquery-3.6.0/jquery-3.6.0.min.js"></script><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><link href="../deps/bootstrap-5.3.1/bootstrap.min.css" rel="stylesheet"><script src="../deps/bootstrap-5.3.1/bootstrap.bundle.min.js"></script><link href="../deps/font-awesome-6.5.2/css/all.min.css" rel="stylesheet"><link href="../deps/font-awesome-6.5.2/css/v4-shims.min.css" rel="stylesheet"><script src="../deps/headroom-0.11.0/headroom.min.js"></script><script src="../deps/headroom-0.11.0/jQuery.headroom.min.js"></script><script src="../deps/bootstrap-toc-1.0.1/bootstrap-toc.min.js"></script><script src="../deps/clipboard.js-2.0.11/clipboard.min.js"></script><script src="../deps/search-1.0.0/autocomplete.jquery.min.js"></script><script src="../deps/search-1.0.0/fuse.min.js"></script><script src="../deps/search-1.0.0/mark.min.js"></script><!-- pkgdown --><script src="../pkgdown.js"></script><meta property="og:title" content="Recode a variable according to a lookup table — recodeLookup"><meta name="description" content="Recodes the values of a variable. Function resembles the recode
function from the car package, but uses a lookup table to specify old and new values."><meta property="og:description" content="Recodes the values of a variable. Function resembles the recode
function from the car package, but uses a lookup table to specify old and new values."><meta property="og:image" content="https://weirichs.github.io/eatTools/logo.png"></head><body>
    <a href="#main" class="visually-hidden-focusable">Skip to contents</a>


    <nav class="navbar navbar-expand-lg fixed-top bg-light" data-bs-theme="light" aria-label="Site navigation"><div class="container">

    <a class="navbar-brand me-2" href="../index.html">eatTools</a>

    <small class="nav-text text-muted me-auto" data-bs-toggle="tooltip" data-bs-placement="bottom" title="">0.7.8</small>


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
      <img src="../logo.png" class="logo" alt=""><h1>Recode a variable according to a lookup table</h1>

      <div class="d-none name"><code>recodeLookup.rd</code></div>
    </div>

    <div class="ref-description section level2">
    <p>Recodes the values of a variable. Function resembles the <code>recode</code>
function from the <code>car</code> package, but uses a lookup table to specify old and new values.</p>
    </div>

    <div class="section level2">
    <h2 id="ref-usage">Usage<a class="anchor" aria-label="anchor" href="#ref-usage"></a></h2>
    <div class="sourceCode"><pre class="sourceCode r"><code><span><span class="fu">recodeLookup</span><span class="op">(</span><span class="va">var</span>, <span class="va">lookup</span><span class="op">)</span></span></code></pre></div>
    </div>

    <div class="section level2">
    <h2 id="arguments">Arguments<a class="anchor" aria-label="anchor" href="#arguments"></a></h2>
    <p></p>
<dl><dt id="arg-var">var<a class="anchor" aria-label="anchor" href="#arg-var"></a></dt>
<dd><p>a vector (e.g. numeric, character, or factor)</p></dd>

  <dt id="arg-lookup">lookup<a class="anchor" aria-label="anchor" href="#arg-lookup"></a></dt>
<dd><p>a data.frame with exact two columns. First column contains old values, second column new values.
Values which do not occur in the old column remain unchanged.</p></dd>

</dl></div>
    <div class="section level2">
    <h2 id="value">Value<a class="anchor" aria-label="anchor" href="#value"></a></h2>
    <p>a vector of the same length as <code>var</code> with recoded values</p>
    </div>

    <div class="section level2">
    <h2 id="ref-examples">Examples<a class="anchor" aria-label="anchor" href="#ref-examples"></a></h2>
    <div class="sourceCode"><pre class="sourceCode r"><code><span class="r-in"><span><span class="va">num_var</span> <span class="op">&lt;-</span> <span class="fu"><a href="https://rdrr.io/r/base/sample.html" class="external-link">sample</a></span><span class="op">(</span><span class="fl">1</span><span class="op">:</span><span class="fl">10</span>, size <span class="op">=</span> <span class="fl">10</span>, replace <span class="op">=</span> <span class="cn">TRUE</span><span class="op">)</span></span></span>
<span class="r-in"><span><span class="va">lookup</span>  <span class="op">&lt;-</span> <span class="fu"><a href="https://rdrr.io/r/base/data.frame.html" class="external-link">data.frame</a></span><span class="op">(</span>old <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="fl">2</span>, <span class="fl">4</span>, <span class="fl">6</span><span class="op">)</span>, new <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="fl">200</span>,<span class="fl">400</span>,<span class="fl">600</span><span class="op">)</span><span class="op">)</span></span></span>
<span class="r-in"><span><span class="va">num_var2</span><span class="op">&lt;-</span> <span class="fu">recodeLookup</span><span class="op">(</span><span class="va">num_var</span>, <span class="va">lookup</span><span class="op">)</span></span></span>
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

