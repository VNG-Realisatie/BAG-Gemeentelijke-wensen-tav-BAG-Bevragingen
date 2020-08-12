# coding: utf-8

"""
    Huidige bevragingen API

    Deze API levert actuele gegevens over adressen, adresseerbaar objecten en panden. Actueel betekent in deze API `zonder eindstatus`. De bron voor deze API is de basisregistratie adressen en gebouwen (BAG).  # noqa: E501

    The version of the OpenAPI document: 1.0.0
    Contact: bag@kadaster.nl
    Generated by: https://openapi-generator.tech
"""


from __future__ import absolute_import

import re  # noqa: F401

# python 2 and python 3 compatibility library
import six

from openapi_client.api_client import ApiClient
from openapi_client.exceptions import (  # noqa: F401
    ApiTypeError,
    ApiValueError
)


class PandApi(object):
    """NOTE: This class is auto generated by OpenAPI Generator
    Ref: https://openapi-generator.tech

    Do not edit the class manually.
    """

    def __init__(self, api_client=None):
        if api_client is None:
            api_client = ApiClient()
        self.api_client = api_client

    def raadpleeg_pand(self, pandidentificatie, **kwargs):  # noqa: E501
        """levert een pand  # noqa: E501

        Raadpleeg een actueel pand met de identificatie. Een pand is een bouwkundige, constructief zelfstandige eenheid die direct en duurzaam met de aarde is verbonden en betreedbaar en afsluitbaar is. Gebruik de fields parameter als je alleen specifieke velden in het antwoord wil zien, zie [functionele specificaties fields-parameter](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/fields.feature).  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.raadpleeg_pand(pandidentificatie, async_req=True)
        >>> result = thread.get()

        :param async_req bool: execute request asynchronously
        :param str pandidentificatie: Identificatie van een pand uit de BAG. Deze is 16 cijfers lang. (required)
        :param str fields: Hiermee kun je de inhoud van de resource naar behoefte aanpassen door een door komma's gescheiden lijst van property namen op te geven. Bij opgave van niet-bestaande properties wordt een 400 Bad Request teruggegeven. Wanneer de fields parameter niet is opgegeven, worden alle properties met een waarde teruggegeven. Zie [functionele specificaties](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/fields.feature)
        :param str accept_crs: Gewenste CRS van de coördinaten in de response.
        :param _preload_content: if False, the urllib3.HTTPResponse object will
                                 be returned without reading/decoding response
                                 data. Default is True.
        :param _request_timeout: timeout setting for this request. If one
                                 number provided, it will be total request
                                 timeout. It can also be a pair (tuple) of
                                 (connection, read) timeouts.
        :return: PandHalBasis
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        return self.raadpleeg_pand_with_http_info(pandidentificatie, **kwargs)  # noqa: E501

    def raadpleeg_pand_with_http_info(self, pandidentificatie, **kwargs):  # noqa: E501
        """levert een pand  # noqa: E501

        Raadpleeg een actueel pand met de identificatie. Een pand is een bouwkundige, constructief zelfstandige eenheid die direct en duurzaam met de aarde is verbonden en betreedbaar en afsluitbaar is. Gebruik de fields parameter als je alleen specifieke velden in het antwoord wil zien, zie [functionele specificaties fields-parameter](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/fields.feature).  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.raadpleeg_pand_with_http_info(pandidentificatie, async_req=True)
        >>> result = thread.get()

        :param async_req bool: execute request asynchronously
        :param str pandidentificatie: Identificatie van een pand uit de BAG. Deze is 16 cijfers lang. (required)
        :param str fields: Hiermee kun je de inhoud van de resource naar behoefte aanpassen door een door komma's gescheiden lijst van property namen op te geven. Bij opgave van niet-bestaande properties wordt een 400 Bad Request teruggegeven. Wanneer de fields parameter niet is opgegeven, worden alle properties met een waarde teruggegeven. Zie [functionele specificaties](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/fields.feature)
        :param str accept_crs: Gewenste CRS van de coördinaten in de response.
        :param _return_http_data_only: response data without head status code
                                       and headers
        :param _preload_content: if False, the urllib3.HTTPResponse object will
                                 be returned without reading/decoding response
                                 data. Default is True.
        :param _request_timeout: timeout setting for this request. If one
                                 number provided, it will be total request
                                 timeout. It can also be a pair (tuple) of
                                 (connection, read) timeouts.
        :return: tuple(PandHalBasis, status_code(int), headers(HTTPHeaderDict))
                 If the method is called asynchronously,
                 returns the request thread.
        """

        local_var_params = locals()

        all_params = [
            'pandidentificatie',
            'fields',
            'accept_crs'
        ]
        all_params.extend(
            [
                'async_req',
                '_return_http_data_only',
                '_preload_content',
                '_request_timeout'
            ]
        )

        for key, val in six.iteritems(local_var_params['kwargs']):
            if key not in all_params:
                raise ApiTypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method raadpleeg_pand" % key
                )
            local_var_params[key] = val
        del local_var_params['kwargs']
        # verify the required parameter 'pandidentificatie' is set
        if self.api_client.client_side_validation and ('pandidentificatie' not in local_var_params or  # noqa: E501
                                                        local_var_params['pandidentificatie'] is None):  # noqa: E501
            raise ApiValueError("Missing the required parameter `pandidentificatie` when calling `raadpleeg_pand`")  # noqa: E501

        if self.api_client.client_side_validation and 'pandidentificatie' in local_var_params and not re.search(r'^[0-9]{16}$', local_var_params['pandidentificatie']):  # noqa: E501
            raise ApiValueError("Invalid value for parameter `pandidentificatie` when calling `raadpleeg_pand`, must conform to the pattern `/^[0-9]{16}$/`")  # noqa: E501
        collection_formats = {}

        path_params = {}
        if 'pandidentificatie' in local_var_params:
            path_params['pandidentificatie'] = local_var_params['pandidentificatie']  # noqa: E501

        query_params = []
        if 'fields' in local_var_params and local_var_params['fields'] is not None:  # noqa: E501
            query_params.append(('fields', local_var_params['fields']))  # noqa: E501

        header_params = {}
        if 'accept_crs' in local_var_params:
            header_params['Accept-Crs'] = local_var_params['accept_crs']  # noqa: E501

        form_params = []
        local_var_files = {}

        body_params = None
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/hal+json', 'application/problem+json'])  # noqa: E501

        # Authentication setting
        auth_settings = ['apiKeyBAG']  # noqa: E501

        return self.api_client.call_api(
            '/panden/{pandidentificatie}', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='PandHalBasis',  # noqa: E501
            auth_settings=auth_settings,
            async_req=local_var_params.get('async_req'),
            _return_http_data_only=local_var_params.get('_return_http_data_only'),  # noqa: E501
            _preload_content=local_var_params.get('_preload_content', True),
            _request_timeout=local_var_params.get('_request_timeout'),
            collection_formats=collection_formats)

    def raadpleeg_panden(self, **kwargs):  # noqa: E501
        """vindt panden  # noqa: E501

        Zoek actuele panden met de identificatie van een adresseerbaar object of een locatie. Gebruik de fields parameter als je alleen specifieke velden in het antwoord wil zien, zie [functionele specificaties fields-parameter](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/fields.feature).  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.raadpleeg_panden(async_req=True)
        >>> result = thread.get()

        :param async_req bool: execute request asynchronously
        :param str adresseerbaar_object_identificatie: De identificatie van een adresserbaar object uit de BAG. Dit kan een verblijfsobject, een standplaats of een ligplaats zijn.
        :param list[float] locatie: Coordinaten van een locatie die als query-parmeter gebruikt wordt om een object te zoeken. Let op, explode is false dus het formaat is ?locatie=194602.722,464154.308
        :param str fields: Hiermee kun je de inhoud van de resource naar behoefte aanpassen door een door komma's gescheiden lijst van property namen op te geven. Bij opgave van niet-bestaande properties wordt een 400 Bad Request teruggegeven. Wanneer de fields parameter niet is opgegeven, worden alle properties met een waarde teruggegeven. Zie [functionele specificaties](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/fields.feature)
        :param str accept_crs: Gewenste CRS van de coördinaten in de response.
        :param str content_crs: CRS van de meegegeven geometrie. epsg:28992 mapt op het RD New Nederlands coordinatenstelsel.
        :param _preload_content: if False, the urllib3.HTTPResponse object will
                                 be returned without reading/decoding response
                                 data. Default is True.
        :param _request_timeout: timeout setting for this request. If one
                                 number provided, it will be total request
                                 timeout. It can also be a pair (tuple) of
                                 (connection, read) timeouts.
        :return: PandHalCollectie
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        return self.raadpleeg_panden_with_http_info(**kwargs)  # noqa: E501

    def raadpleeg_panden_with_http_info(self, **kwargs):  # noqa: E501
        """vindt panden  # noqa: E501

        Zoek actuele panden met de identificatie van een adresseerbaar object of een locatie. Gebruik de fields parameter als je alleen specifieke velden in het antwoord wil zien, zie [functionele specificaties fields-parameter](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/fields.feature).  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.raadpleeg_panden_with_http_info(async_req=True)
        >>> result = thread.get()

        :param async_req bool: execute request asynchronously
        :param str adresseerbaar_object_identificatie: De identificatie van een adresserbaar object uit de BAG. Dit kan een verblijfsobject, een standplaats of een ligplaats zijn.
        :param list[float] locatie: Coordinaten van een locatie die als query-parmeter gebruikt wordt om een object te zoeken. Let op, explode is false dus het formaat is ?locatie=194602.722,464154.308
        :param str fields: Hiermee kun je de inhoud van de resource naar behoefte aanpassen door een door komma's gescheiden lijst van property namen op te geven. Bij opgave van niet-bestaande properties wordt een 400 Bad Request teruggegeven. Wanneer de fields parameter niet is opgegeven, worden alle properties met een waarde teruggegeven. Zie [functionele specificaties](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/fields.feature)
        :param str accept_crs: Gewenste CRS van de coördinaten in de response.
        :param str content_crs: CRS van de meegegeven geometrie. epsg:28992 mapt op het RD New Nederlands coordinatenstelsel.
        :param _return_http_data_only: response data without head status code
                                       and headers
        :param _preload_content: if False, the urllib3.HTTPResponse object will
                                 be returned without reading/decoding response
                                 data. Default is True.
        :param _request_timeout: timeout setting for this request. If one
                                 number provided, it will be total request
                                 timeout. It can also be a pair (tuple) of
                                 (connection, read) timeouts.
        :return: tuple(PandHalCollectie, status_code(int), headers(HTTPHeaderDict))
                 If the method is called asynchronously,
                 returns the request thread.
        """

        local_var_params = locals()

        all_params = [
            'adresseerbaar_object_identificatie',
            'locatie',
            'fields',
            'accept_crs',
            'content_crs'
        ]
        all_params.extend(
            [
                'async_req',
                '_return_http_data_only',
                '_preload_content',
                '_request_timeout'
            ]
        )

        for key, val in six.iteritems(local_var_params['kwargs']):
            if key not in all_params:
                raise ApiTypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method raadpleeg_panden" % key
                )
            local_var_params[key] = val
        del local_var_params['kwargs']

        if self.api_client.client_side_validation and 'adresseerbaar_object_identificatie' in local_var_params and not re.search(r'^[0-9]{16}$', local_var_params['adresseerbaar_object_identificatie']):  # noqa: E501
            raise ApiValueError("Invalid value for parameter `adresseerbaar_object_identificatie` when calling `raadpleeg_panden`, must conform to the pattern `/^[0-9]{16}$/`")  # noqa: E501
        if self.api_client.client_side_validation and ('locatie' in local_var_params and  # noqa: E501
                                                        len(local_var_params['locatie']) > 2):  # noqa: E501
            raise ApiValueError("Invalid value for parameter `locatie` when calling `raadpleeg_panden`, number of items must be less than or equal to `2`")  # noqa: E501
        if self.api_client.client_side_validation and ('locatie' in local_var_params and  # noqa: E501
                                                        len(local_var_params['locatie']) < 2):  # noqa: E501
            raise ApiValueError("Invalid value for parameter `locatie` when calling `raadpleeg_panden`, number of items must be greater than or equal to `2`")  # noqa: E501
        collection_formats = {}

        path_params = {}

        query_params = []
        if 'adresseerbaar_object_identificatie' in local_var_params and local_var_params['adresseerbaar_object_identificatie'] is not None:  # noqa: E501
            query_params.append(('adresseerbaarObjectIdentificatie', local_var_params['adresseerbaar_object_identificatie']))  # noqa: E501
        if 'locatie' in local_var_params and local_var_params['locatie'] is not None:  # noqa: E501
            query_params.append(('locatie', local_var_params['locatie']))  # noqa: E501
            collection_formats['locatie'] = 'csv'  # noqa: E501
        if 'fields' in local_var_params and local_var_params['fields'] is not None:  # noqa: E501
            query_params.append(('fields', local_var_params['fields']))  # noqa: E501

        header_params = {}
        if 'accept_crs' in local_var_params:
            header_params['Accept-Crs'] = local_var_params['accept_crs']  # noqa: E501
        if 'content_crs' in local_var_params:
            header_params['Content-Crs'] = local_var_params['content_crs']  # noqa: E501

        form_params = []
        local_var_files = {}

        body_params = None
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/hal+json', 'application/problem+json'])  # noqa: E501

        # Authentication setting
        auth_settings = ['apiKeyBAG']  # noqa: E501

        return self.api_client.call_api(
            '/panden', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='PandHalCollectie',  # noqa: E501
            auth_settings=auth_settings,
            async_req=local_var_params.get('async_req'),
            _return_http_data_only=local_var_params.get('_return_http_data_only'),  # noqa: E501
            _preload_content=local_var_params.get('_preload_content', True),
            _request_timeout=local_var_params.get('_request_timeout'),
            collection_formats=collection_formats)