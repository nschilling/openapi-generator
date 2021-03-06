{-
   Composition and Inheritence (Polymorphism)
   No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

   The version of the OpenAPI document: 1.0.0

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.ObjectA exposing (ObjectA, decoder, encode, encodeWithTag, toString)

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode


type alias ObjectA =
    { objectType : String
    , valueA : Maybe String
    }


decoder : Decoder ObjectA
decoder =
    Decode.succeed ObjectA
        |> required "objectType" Decode.string
        |> optional "valueA" (Decode.nullable Decode.string) Nothing


encode : ObjectA -> Encode.Value
encode =
    Encode.object << encodePairs


encodeWithTag : ( String, String ) -> ObjectA -> Encode.Value
encodeWithTag ( tagField, tag ) model =
    Encode.object <| encodePairs model ++ [ ( tagField, Encode.string tag ) ]


encodePairs : ObjectA -> List ( String, Encode.Value )
encodePairs model =
    [ ( "objectType", Encode.string model.objectType )
    , ( "valueA", Maybe.withDefault Encode.null (Maybe.map Encode.string model.valueA) )
    ]


toString : ObjectA -> String
toString =
    Encode.encode 0 << encode
