// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#pragma once

#include <string>

namespace EzoRed { namespace Http {

struct HttpResponse;

/** Platform-Specific implementation of Http Client class */
class HttpClientPlatformService {
public:
    virtual ~HttpClientPlatformService() {}

    virtual HttpResponse doGet(const std::string & url) = 0;

    virtual HttpResponse doHead(const std::string & url) = 0;

    virtual HttpResponse doPost(const std::string & url, const std::string & data, const std::string & content_type) = 0;

    virtual HttpResponse doPut(const std::string & url, const std::string & data, const std::string & content_type) = 0;

    virtual HttpResponse doDelete(const std::string & url, const std::string & data, const std::string & content_type) = 0;

    virtual HttpResponse doPatch(const std::string & url, const std::string & data, const std::string & content_type) = 0;
};

} }  // namespace EzoRed::Http
