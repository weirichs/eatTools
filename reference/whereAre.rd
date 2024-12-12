<!DOCTYPE html>
<!-- Generated by pkgdown: do not edit by hand --><html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><title>Matches a scalar with elements of a vector. — whereAre • eatTools</title><script src="../deps/jquery-3.6.0/jquery-3.6.0.min.js"></script><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><link href="../deps/bootstrap-5.3.1/bootstrap.min.css" rel="stylesheet"><script src="../deps/bootstrap-5.3.1/bootstrap.bundle.min.js"></script><link href="../deps/font-awesome-6.5.2/css/all.min.css" rel="stylesheet"><link href="../deps/font-awesome-6.5.2/css/v4-shims.min.css" rel="stylesheet"><script src="../deps/headroom-0.11.0/headroom.min.js"></script><script src="../deps/headroom-0.11.0/jQuery.headroom.min.js"></script><script src="../deps/bootstrap-toc-1.0.1/bootstrap-toc.min.js"></script><script src="../deps/clipboard.js-2.0.11/clipboard.min.js"></script><script src="../deps/search-1.0.0/autocomplete.jquery.min.js"></script><script src="../deps/search-1.0.0/fuse.min.js"></script><script src="../deps/search-1.0.0/mark.min.js"></script><!-- pkgdown --><script src="../pkgdown.js"></script><meta property="og:title" content="Matches a scalar with elements of a vector. — whereAre"><meta name="description" content="The function closely resembles the match function, but allows for
multiple matches."><meta property="og:description" content="The function closely resembles the match function, but allows for
multiple matches."><meta property="og:image" content="https://weirichs.github.io/eatTools/logo.png"></head><body>
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
      <img src="../logo.png" class="logo" alt=""><h1>Matches a scalar with elements of a vector.</h1>

      <div class="d-none name"><code>whereAre.rd</code></div>
    </div>

    <div class="ref-description section level2">
    <p>The function closely resembles the <code>match</code> function, but allows for
multiple matches.</p>
    </div>

    <div class="section level2">
    <h2 id="ref-usage">Usage<a class="anchor" aria-label="anchor" href="#ref-usage"></a></h2>
    <div class="sourceCode"><pre class="sourceCode r"><code><span><span class="fu">whereAre</span><span class="op">(</span><span class="va">a</span>,<span class="va">b</span>,verbose<span class="op">=</span><span class="cn">TRUE</span><span class="op">)</span></span></code></pre></div>
    </div>

    <div class="section level2">
    <h2 id="arguments">Arguments<a class="anchor" aria-label="anchor" href="#arguments"></a></h2>
    <p></p>
<dl><dt id="arg-a">a<a class="anchor" aria-label="anchor" href="#arg-a"></a></dt>
<dd><p><!-- %%     ~~Describe \code{file} here~~ -->
a scalar</p></dd>

  <dt id="arg-b">b<a class="anchor" aria-label="anchor" href="#arg-b"></a></dt>
<dd><p><!-- %%     ~~Describe \code{file} here~~ -->
a numeric or character vector</p></dd>

  <dt id="arg-verbose">verbose<a class="anchor" aria-label="anchor" href="#arg-verbose"></a></dt>
<dd><p><!-- %%     ~~Describe \code{file} here~~ -->
logical: print messages on console?</p></dd>

</dl></div>
    <div class="section level2">
    <h2 id="value">Value<a class="anchor" aria-label="anchor" href="#value"></a></h2>
    <p>A numeric vector</p>
    </div>
    <div class="section level2">
    <h2 id="author">Author<a class="anchor" aria-label="anchor" href="#author"></a></h2>
    <p>Sebastian Weirich</p>
    </div>

    <div class="section level2">
    <h2 id="ref-examples">Examples<a class="anchor" aria-label="anchor" href="#ref-examples"></a></h2>
    <div class="sourceCode"><pre class="sourceCode r"><code><span class="r-in"><span><span class="va">a</span> <span class="op">&lt;-</span> <span class="fl">12</span></span></span>
<span class="r-in"><span><span class="va">b</span> <span class="op">&lt;-</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="fl">10</span>, <span class="fl">11</span>, <span class="fl">12</span>, <span class="fl">10</span>, <span class="fl">11</span>, <span class="fl">12</span><span class="op">)</span></span></span>
<span class="r-in"><span><span class="fu"><a href="https://rdrr.io/r/base/match.html" class="external-link">match</a></span><span class="op">(</span><span class="va">a</span>, <span class="va">b</span><span class="op">)</span></span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span> [1] 3</span>
<span class="r-in"><span><span class="fu">whereAre</span><span class="op">(</span>a<span class="op">=</span><span class="va">a</span>, b<span class="op">=</span><span class="va">b</span><span class="op">)</span></span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span> Found 2 elements.</span>
<span class="r-out co"><span class="r-pr">#&gt;</span> [1] 3 6</span>
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

