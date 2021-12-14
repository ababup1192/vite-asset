module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { draft : String
    , messages : List String
    , assets: { favicon: String }
    }


init : { favicon: String } -> ( Model, Cmd Msg )
init assets =
    ( { draft = "", messages = [], assets = assets }
    , Cmd.none
    )


type Msg
    = DraftChanged String
    | Send


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DraftChanged draft ->
            ( { model | draft = draft }
            , Cmd.none
            )

        Send ->
            ( { model | draft = "", messages = model.messages ++ [ model.draft ] }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ img [ src "src/favicon.svg" ] [], 
        h1 [] [ text "Echo Chat" ]
        , input
            [ type_ "text"
            , placeholder "Draft"
            , onInput DraftChanged
            , value model.draft
            ]
            []
        , button [ onClick Send ] [ text "Send" ]
        , ul []
            (List.map (\msg -> li [] [ text msg ]) model.messages)
        ]


main : Program  { favicon: String }  Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
