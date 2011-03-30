%%%-------------------------------------------------------------------
%%% File:      folsom_statistics_resource.erl
%%% @author    joe williams <j@fastip.com>
%%% @copyright 2011 fast_ip
%%% @doc
%%% http end point that converts erlang:statistics/1 to json
%%% @end
%%%------------------------------------------------------------------

-module(folsom_statistics_resource).

-export([init/1, content_types_provided/2, to_json/2, allowed_methods/2]).

-include_lib("webmachine/include/webmachine.hrl").

init(_) -> {ok, undefined}.

content_types_provided(ReqData, Context) ->
    {[{"application/json", to_json}], ReqData, Context}.

allowed_methods(ReqData, Context) ->
    {['GET'], ReqData, Context}.

to_json(ReqData, Context) ->
    {mochijson2:encode(folsom_vm_metrics:get_statistics()), ReqData, Context}.