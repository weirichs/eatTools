<!DOCTYPE html>
<!-- Generated by pkgdown: do not edit by hand --><html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><title>Merge Two Data Frames with additional messages and maintain variable attributes — mergeAttr • eatTools</title><script src="../deps/jquery-3.6.0/jquery-3.6.0.min.js"></script><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><link href="../deps/bootstrap-5.3.1/bootstrap.min.css" rel="stylesheet"><script src="../deps/bootstrap-5.3.1/bootstrap.bundle.min.js"></script><link href="../deps/font-awesome-6.5.2/css/all.min.css" rel="stylesheet"><link href="../deps/font-awesome-6.5.2/css/v4-shims.min.css" rel="stylesheet"><script src="../deps/headroom-0.11.0/headroom.min.js"></script><script src="../deps/headroom-0.11.0/jQuery.headroom.min.js"></script><script src="../deps/bootstrap-toc-1.0.1/bootstrap-toc.min.js"></script><script src="../deps/clipboard.js-2.0.11/clipboard.min.js"></script><script src="../deps/search-1.0.0/autocomplete.jquery.min.js"></script><script src="../deps/search-1.0.0/fuse.min.js"></script><script src="../deps/search-1.0.0/mark.min.js"></script><!-- pkgdown --><script src="../pkgdown.js"></script><meta property="og:title" content="Merge Two Data Frames with additional messages and maintain variable attributes — mergeAttr"><meta name="description" content="This is a wrapper for the merge function. merge
does not maintain variable attributes. mergeAttr might be useful if variable
attributes should be maintained. For example, if SPSS data are imported via
read.spss, variable and value labels are stored
as attributes which get lost if data are merged subsequently. Moreover, function gives
additional messages if (combinations of) by-variables are not unique in at least one data.frame,
or if by-variables have different classes, or if some units of the by-variables are missing in
one of the data sets. Users are free to specify which kind of messages are desirable."><meta property="og:description" content="This is a wrapper for the merge function. merge
does not maintain variable attributes. mergeAttr might be useful if variable
attributes should be maintained. For example, if SPSS data are imported via
read.spss, variable and value labels are stored
as attributes which get lost if data are merged subsequently. Moreover, function gives
additional messages if (combinations of) by-variables are not unique in at least one data.frame,
or if by-variables have different classes, or if some units of the by-variables are missing in
one of the data sets. Users are free to specify which kind of messages are desirable."><meta property="og:image" content="https://weirichs.github.io/eatTools/logo.png"></head><body>
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
      <img src="../logo.png" class="logo" alt=""><h1>Merge Two Data Frames with additional messages and maintain variable attributes</h1>

      <div class="d-none name"><code>mergeAttr.rd</code></div>
    </div>

    <div class="ref-description section level2">
    <p>This is a wrapper for the <code><a href="https://rdrr.io/r/base/merge.html" class="external-link">merge</a></code> function. <code>merge</code>
does not maintain variable attributes. <code>mergeAttr</code> might be useful if variable
attributes should be maintained. For example, if SPSS data are imported via
<code><a href="https://rdrr.io/pkg/foreign/man/read.spss.html" class="external-link">read.spss</a></code>, variable and value labels are stored
as attributes which get lost if data are merged subsequently. Moreover, function gives
additional messages if (combinations of) by-variables are not unique in at least one data.frame,
or if by-variables have different classes, or if some units of the by-variables are missing in
one of the data sets. Users are free to specify which kind of messages are desirable.</p>
    </div>

    <div class="section level2">
    <h2 id="ref-usage">Usage<a class="anchor" aria-label="anchor" href="#ref-usage"></a></h2>
    <div class="sourceCode"><pre class="sourceCode r"><code><span><span class="fu">mergeAttr</span><span class="op">(</span><span class="va">x</span>, <span class="va">y</span>, by <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/sets.html" class="external-link">intersect</a></span><span class="op">(</span><span class="fu"><a href="https://rdrr.io/r/base/names.html" class="external-link">names</a></span><span class="op">(</span><span class="va">x</span><span class="op">)</span>, <span class="fu"><a href="https://rdrr.io/r/base/names.html" class="external-link">names</a></span><span class="op">(</span><span class="va">y</span><span class="op">)</span><span class="op">)</span>,</span>
<span>      by.x <span class="op">=</span> <span class="va">by</span>, by.y <span class="op">=</span> <span class="va">by</span>, all <span class="op">=</span> <span class="cn">FALSE</span>, all.x <span class="op">=</span> <span class="va">all</span>, all.y <span class="op">=</span> <span class="va">all</span>,</span>
<span>      sort <span class="op">=</span> <span class="cn">TRUE</span>, suffixes <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="st">".x"</span>,<span class="st">".y"</span><span class="op">)</span>, setAttr <span class="op">=</span> <span class="cn">TRUE</span>, onlyVarValLabs <span class="op">=</span> <span class="cn">TRUE</span>,</span>
<span>      homoClass <span class="op">=</span> <span class="cn">TRUE</span>, unitName <span class="op">=</span> <span class="st">"unit"</span>, xName <span class="op">=</span> <span class="st">"x"</span>, yName <span class="op">=</span> <span class="st">"y"</span>,</span>
<span>      verbose <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="st">"match"</span>, <span class="st">"unique"</span>, <span class="st">"class"</span>, <span class="st">"dataframe"</span>, <span class="st">"common"</span>, <span class="st">"convert"</span><span class="op">)</span><span class="op">)</span></span></code></pre></div>
    </div>

    <div class="section level2">
    <h2 id="arguments">Arguments<a class="anchor" aria-label="anchor" href="#arguments"></a></h2>
    <p></p>
<dl><dt id="arg-x">x<a class="anchor" aria-label="anchor" href="#arg-x"></a></dt>
<dd><p>first data frame to be merged.</p></dd>

  <dt id="arg-y">y<a class="anchor" aria-label="anchor" href="#arg-y"></a></dt>
<dd><p>second data frame to be merged.</p></dd>

  <dt id="arg-by">by<a class="anchor" aria-label="anchor" href="#arg-by"></a></dt>
<dd><p>specifications of the columns used for merging</p></dd>

  <dt id="arg-by-x">by.x<a class="anchor" aria-label="anchor" href="#arg-by-x"></a></dt>
<dd><p>specifications of the columns used for merging</p></dd>

  <dt id="arg-by-y">by.y<a class="anchor" aria-label="anchor" href="#arg-by-y"></a></dt>
<dd><p>specifications of the columns used for merging</p></dd>

  <dt id="arg-all">all<a class="anchor" aria-label="anchor" href="#arg-all"></a></dt>
<dd><p>logical; <code>all = L</code> is shorthand for <code>all.x = L</code> and <code>all.y = L</code>,
where <code>L</code> is either <code>TRUE</code> or <code>FALSE</code>.</p></dd>

  <dt id="arg-all-x">all.x<a class="anchor" aria-label="anchor" href="#arg-all-x"></a></dt>
<dd><p>logical; if <code>TRUE</code>, then extra rows will be added to the output, one for each
row in <code>x</code> that has no matching row in <code>y</code>. These rows will have <code>NAs</code>
in those columns that are usually filled with values from <code>y</code>. The default
is <code>FALSE</code>, so that only rows with data from both <code>x</code> and <code>y</code> are
included in the output.</p></dd>

  <dt id="arg-all-y">all.y<a class="anchor" aria-label="anchor" href="#arg-all-y"></a></dt>
<dd><p>logical; analogous to <code>all.x</code>.</p></dd>

  <dt id="arg-sort">sort<a class="anchor" aria-label="anchor" href="#arg-sort"></a></dt>
<dd><p>logical. Should the result be sorted on the <code>by</code> columns?</p></dd>

  <dt id="arg-suffixes">suffixes<a class="anchor" aria-label="anchor" href="#arg-suffixes"></a></dt>
<dd><p>a character vector of length 2 specifying the suffixes to be used for making unique
the names of columns in the result which not used for merging (appearing in <code>by</code> etc).</p></dd>

  <dt id="arg-setattr">setAttr<a class="anchor" aria-label="anchor" href="#arg-setattr"></a></dt>
<dd><p>Logical: restore the variable attributes? If FALSE, the behavior of <code>mergeAttr</code> equals
the behavior of <code>merge</code>.</p></dd>

  <dt id="arg-onlyvarvallabs">onlyVarValLabs<a class="anchor" aria-label="anchor" href="#arg-onlyvarvallabs"></a></dt>
<dd><p>Logical: If TRUE, only the variable and value labels as captured by <code>read.spss</code> and
stored by <code>convertLabel</code> from the <code>eatAnalysis</code> package will be restored.
If FALSE, all variable attributes will be restored.</p></dd>

  <dt id="arg-homoclass">homoClass<a class="anchor" aria-label="anchor" href="#arg-homoclass"></a></dt>
<dd><p>Logical: Beginning with R version 3.5, <code>merge</code> may give an error if the class of the
by-variables differs in both data.frames. If TRUE, class of by-variable(s) will be homogenized
before merging.</p></dd>

  <dt id="arg-unitname">unitName<a class="anchor" aria-label="anchor" href="#arg-unitname"></a></dt>
<dd><p>Optional: Set the name for the unit variable to get more informative messages. This is mainly
relevant if <code>mergeAttr</code> is called from other functions.</p></dd>

  <dt id="arg-xname">xName<a class="anchor" aria-label="anchor" href="#arg-xname"></a></dt>
<dd><p>Optional: Set the name for the x data.frame to get more informative messages. This is mainly
relevant if <code>mergeAttr</code> is called from other functions.</p></dd>

  <dt id="arg-yname">yName<a class="anchor" aria-label="anchor" href="#arg-yname"></a></dt>
<dd><p>Optional: Set the name for the y data.frame to get more informative messages. This is mainly
relevant if <code>mergeAttr</code> is called from other functions.</p></dd>

  <dt id="arg-verbose">verbose<a class="anchor" aria-label="anchor" href="#arg-verbose"></a></dt>
<dd><p>Optional: Choose whether messages concerning missing levels in by-variables should be printed
on console (<code>"match"</code>), or messages concerning uniqueness of by-variables (<code>"unique"</code>),
or messages concerning different classes of by-variables (<code>"class"</code>), or messages concerning
appropriate class (<code>data.frame</code>) of <code>x</code> and <code>y</code> (<code>"dataframe"</code>), or messages
concerning additional common variables (except by-variables; <code>"common"</code>)), or messages
concerning converting of tibbles, tbls to data.frames (<code>"convert"</code>). Multiple choices
are possible, e.g. <code>verbose = c("match", "class")</code>. If <code>verbose = TRUE</code>, all
messages are printed, if <code>verbose = FALSE</code>, no messages are printed at all. The default
is equivalent to <code>verbose = TRUE</code>.</p></dd>

</dl></div>
    <div class="section level2">
    <h2 id="value">Value<a class="anchor" aria-label="anchor" href="#value"></a></h2>
    <p>data frame. See the help page of <code><a href="https://rdrr.io/r/base/merge.html" class="external-link">merge</a></code> for further details.</p>
    </div>

    <div class="section level2">
    <h2 id="ref-examples">Examples<a class="anchor" aria-label="anchor" href="#ref-examples"></a></h2>
    <div class="sourceCode"><pre class="sourceCode r"><code><span class="r-in"><span><span class="co">### data frame 1, variable 'y' with variable.label 'test participation'</span></span></span>
<span class="r-in"><span><span class="va">df1</span> <span class="op">&lt;-</span> <span class="fu"><a href="https://rdrr.io/r/base/data.frame.html" class="external-link">data.frame</a></span> <span class="op">(</span> id <span class="op">=</span> <span class="fl">1</span><span class="op">:</span><span class="fl">3</span>, sex <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/factor.html" class="external-link">factor</a></span> <span class="op">(</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="st">"male"</span>, <span class="st">"male"</span>, <span class="st">"female"</span><span class="op">)</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>       happy <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="st">"low"</span>, <span class="st">"low"</span>, <span class="st">"medium"</span><span class="op">)</span><span class="op">)</span></span></span>
<span class="r-in"><span><span class="fu"><a href="https://rdrr.io/r/base/attr.html" class="external-link">attr</a></span><span class="op">(</span><span class="va">df1</span><span class="op">[</span>,<span class="st">"happy"</span><span class="op">]</span>, <span class="st">"variable.label"</span><span class="op">)</span> <span class="op">&lt;-</span> <span class="st">"happieness in the workplace"</span></span></span>
<span class="r-in"><span></span></span>
<span class="r-in"><span><span class="co">### data frame 2 without labels </span></span></span>
<span class="r-in"><span><span class="va">df2</span> <span class="op">&lt;-</span> <span class="fu"><a href="https://rdrr.io/r/base/data.frame.html" class="external-link">data.frame</a></span> <span class="op">(</span> id <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/factor.html" class="external-link">as.factor</a></span><span class="op">(</span><span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="fl">2</span>,<span class="fl">2</span>,<span class="fl">4</span><span class="op">)</span><span class="op">)</span>, status <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/factor.html" class="external-link">factor</a></span> <span class="op">(</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="st">"married"</span>, <span class="st">"married"</span>, <span class="st">"single"</span><span class="op">)</span><span class="op">)</span>,</span></span>
<span class="r-in"><span>       convicted <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="cn">FALSE</span>, <span class="cn">FALSE</span>, <span class="cn">TRUE</span><span class="op">)</span><span class="op">)</span></span></span>
<span class="r-in"><span></span></span>
<span class="r-in"><span><span class="co">### lost label after merging</span></span></span>
<span class="r-in"><span><span class="va">df3</span> <span class="op">&lt;-</span> <span class="fu"><a href="https://rdrr.io/r/base/merge.html" class="external-link">merge</a></span><span class="op">(</span><span class="va">df1</span>, <span class="va">df2</span>, all <span class="op">=</span> <span class="cn">TRUE</span><span class="op">)</span></span></span>
<span class="r-in"><span><span class="fu"><a href="https://rdrr.io/r/base/attr.html" class="external-link">attr</a></span><span class="op">(</span><span class="va">df3</span><span class="op">[</span>,<span class="st">"happy"</span><span class="op">]</span>, <span class="st">"variable.label"</span><span class="op">)</span></span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span> NULL</span>
<span class="r-in"><span></span></span>
<span class="r-in"><span><span class="co">### maintain label</span></span></span>
<span class="r-in"><span><span class="va">df4</span> <span class="op">&lt;-</span> <span class="fu">mergeAttr</span><span class="op">(</span><span class="va">df1</span>, <span class="va">df2</span>, all <span class="op">=</span> <span class="cn">TRUE</span>, onlyVarValLabs <span class="op">=</span> <span class="cn">FALSE</span><span class="op">)</span></span></span>
<span class="r-msg co"><span class="r-pr">#&gt;</span> 1 of 2 unit(s) of merging variable 'id' from data set 'y' not included in data set 'x'.</span>
<span class="r-msg co"><span class="r-pr">#&gt;</span> 2 of 3 unit(s) of merging variable 'id' from data set 'x' not included in data set 'y'.</span>
<span class="r-msg co"><span class="r-pr">#&gt;</span> Merging levels are not unique in data set 'y'.</span>
<span class="r-msg co"><span class="r-pr">#&gt;</span>    Merging variable pair 'id'&lt;==&gt;'id' has different classes: 'integer'&lt;==&gt;'factor'. Classes will be homogenized to 'character'.</span>
<span class="r-msg co"><span class="r-pr">#&gt;</span>    Use 'homoClass = FALSE' to suppress this behavior.</span>
<span class="r-in"><span><span class="fu"><a href="https://rdrr.io/r/base/attr.html" class="external-link">attr</a></span><span class="op">(</span><span class="va">df4</span><span class="op">[</span>,<span class="st">"happy"</span><span class="op">]</span>, <span class="st">"variable.label"</span><span class="op">)</span></span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span> [1] "happieness in the workplace"</span>
<span class="r-in"><span></span></span>
<span class="r-in"><span><span class="co">### adapt messages</span></span></span>
<span class="r-in"><span><span class="va">df5</span> <span class="op">&lt;-</span> <span class="fu">mergeAttr</span><span class="op">(</span><span class="va">df1</span>, <span class="va">df2</span>, all <span class="op">=</span> <span class="cn">TRUE</span>, onlyVarValLabs <span class="op">=</span> <span class="cn">FALSE</span>, unitName <span class="op">=</span> <span class="st">"student"</span>,</span></span>
<span class="r-in"><span>       xName <span class="op">=</span> <span class="st">"student questionnaire"</span>, yName <span class="op">=</span> <span class="st">"school questionnaire"</span>,</span></span>
<span class="r-in"><span>       verbose <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="st">"match"</span>, <span class="st">"unique"</span><span class="op">)</span><span class="op">)</span></span></span>
<span class="r-msg co"><span class="r-pr">#&gt;</span> 1 of 2 student(s) of merging variable 'id' from data set 'school questionnaire' not included in data set 'student questionnaire'.</span>
<span class="r-msg co"><span class="r-pr">#&gt;</span> 2 of 3 student(s) of merging variable 'id' from data set 'student questionnaire' not included in data set 'school questionnaire'.</span>
<span class="r-msg co"><span class="r-pr">#&gt;</span> Merging levels are not unique in data set 'school questionnaire'.</span>
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

