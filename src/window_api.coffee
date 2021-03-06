###
Copyright (c) 2013, Groupon, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

Neither the name of GROUPON nor the names of its contributors may be
used to endorse or promote products derived from this software without
specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
###

parseResponseData = require './parse_response'

module.exports = (http) ->
  switchToDefaultFrame: ->
    http.post '/frame'
    return

  switchToFrame: (indexOrNameOrId) ->
    http.post '/frame', { id: indexOrNameOrId }
    return

  getCurrentWindowHandle: ->
    response = http.get '/window_handle'
    parseResponseData(response)

  getWindowHandles: ->
    response = http.get '/window_handles'
    parseResponseData(response)

  switchToWindow: (name) ->
    http.post '/window', { name }
    return

  closeWindow: ->
    http.delete '/window'
    return

  getWindowSize: (windowHandle='current') ->
    response = http.get "/window/#{windowHandle}/size"
    parseResponseData(response)

  setWindowSize: (width, height, windowHandle='current') ->
    http.post "/window/#{windowHandle}/size", { width, height }
    return

  getWindowPosition: (windowHandle='current') ->
    response = http.get "/window/#{windowHandle}/position"
    parseResponseData(response)

  setWindowPosition: (x, y, windowHandle='current') ->
    http.post "/window/#{windowHandle}/position", { x, y }
    return

  maximizeWindow: (windowHandle='current') ->
    http.post "/window/#{windowHandle}/maximize"
    return

