#include <vector>

#include "phpcpp.h"

#include "ip/Cidr.h"

namespace IpTools
{
    class Cidr : public Php::Base
    {
        public:
            virtual void __construct(Php::Parameters& params)
            {
                if (params.size() > 0) {
                    std::vector<Ip::Cidr> results;
                    Ip::Cidr::buildFromString(params[0].stringValue(), results);

                    if (results.size() > 1) {
                        throw new Php::Exception("Conversation from " + params[0].stringValue() + " to Ip::Cidr is ambiguous.");
                    }

                    cidr = results[0];
                }
            }
        private:
            Ip::Cidr cidr;
    };
}

extern "C" {

    // export the "get_module" function that will be called by the Zend engine
    PHPCPP_EXPORT void *get_module() {

        // create extension
        static Php::Extension extension("ip-tools","0.1");

        Php::Namespace ns("IpTools");

        // define used classes
        Php::Class<IpTools::Cidr> classCidr("Cidr");

        // add used class methods
        classCidr.method("__construct", &IpTools::Cidr::__construct);

        //add class to extensions
        ns.add(classCidr);

        extension.add(ns);

        // return the extension module
        return extension;
    }
}